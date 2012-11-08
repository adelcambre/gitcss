class GitCSS::Selector
  def self.parse(selector)
    Nokogiri::CSS.parse(selector).map{|s| parse_part(s) }.flatten
  end

  def self.parse_part(selector)
    case selector.type
    when :ELEMENT_NAME
      [new_from_element(selector)]
    when :DESCENDANT_SELECTOR
      selector.value.map{|s| parse_part(s) }
    when :CONDITIONAL_SELECTOR
      [new_from_condition(selector)]
    end
  end

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
