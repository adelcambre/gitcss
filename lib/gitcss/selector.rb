class GitCSS::Selector
  def initialize(selector)
    @selector = Nokogiri::CSS.parse(selector)
    @parts = @selector.map{|s| parse(s) }.flatten
  end

  attr_reader :parts

  def parse(selector)
    case selector.type
    when :ELEMENT_NAME
      [GitCSS::SelectorPart.new_from_element(selector)]
    when :DESCENDANT_SELECTOR
      selector.value.map{|s| parse(s) }
    when :CONDITIONAL_SELECTOR
      [GitCSS::SelectorPart.new_from_condition(selector)]
    end
  end
end


class GitCSS::SelectorPart
  def initialize(type, attrs)
    @type, @attrs = type, attrs
  end

  attr_reader :type, :attrs

  def id
    attrs["id"]
  end

  def self.new_from_condition(selector)
    new(selector.value.first.value.first, Hash[*parse_attrs(selector.value.last)])
  end

  def self.new_from_element(selector)
    new(selector.value.first, {})
  end

  def self.parse_attrs(selector)
    case selector.type
    when :COMBINATOR
      selector.value.map{|s| parse_attrs(s) }.flatten
    when :ID
      ["id", selector.value.first[1..-1]]
    when :ATTRIBUTE_CONDITION
      [selector.value.first.value.first, selector.value.last.gsub(/['"]/, "")]
    end
  end
end
