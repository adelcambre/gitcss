# GitCSS

A small gem to browse a git repo using CSS selectors. 

It uses nokogiri to parse out the CSS selector and then 
rugged to browse the git repo.

Currently only "commit#sha" and "tree#sha" are implemented. 

## Usage

```ruby
gitcss = GitCSS.new("path/to/repo")
gitcss.get("commit#sha")
```

### Examples of selectors
GitCSS naturaly uses a small subset of the total number of selectors
available in CSS. I will try to mark these as they are implemented.


#### Implemented

```
commit#sha         # Fetch a commit by sha
tree#sha           # Fetch a tree by sha
blob#sha           # Fetch a blob by sha
```

#### To Do

```
ref[name=master]    #
tag[name=master]    # All three of these fetch a ref by name 
branch[name=master] #

commit[email=adelcambre@gmail.com] # Fetch all commits by an email
commit[author="Andy Delcambre"] # Fetch all commits by author name

commit#sha tree[path='foo/bar'] # Fetch the tree with path foo/bar under
                                # commit referenced by sha
```

## Authors

* Andy Delcambre <adelcambre@gmail.com>
* Brian Lopez <seniorlopez@gmail.com>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
