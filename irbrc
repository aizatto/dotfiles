# load rubygems and wirble
require 'rubygems' rescue nil
require 'wirble'

# load wirble
Wirble.init
Wirble.colorize

class Object
  def methods_with_sort(filter = nil)
    methods = methods_without_sort
    if filter
      filter  = Regexp.new(filter.to_s, true) unless filter.is_a? Regexp
      methods = methods.select { |method| method =~ filter }
    end
    methods.sort
  end
  alias_method :methods_without_sort, :methods
  alias_method :methods, :methods_with_sort

  def instance_variables_with_sort
    instance_variables_without_sort.sort
  end
  alias_method :instance_variables_without_sort, :instance_variables
  alias_method :instance_variables, :instance_variables_with_sort
end
