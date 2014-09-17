$LOAD_PATH << File.dirname(__FILE__)

require 'pry'

require 'yaml'
require 'bigdecimal'
require "supreme_math/calculus"

# Classes
require 'supreme_math/term'
require 'supreme_math/constant'
require 'supreme_math/variable'
require 'supreme_math/coefficient'
require 'supreme_math/base'
require 'supreme_math/exponent'
require 'supreme_math/independent_variable'
require 'supreme_math/supreme_rational'
require 'supreme_math/rational_function'
require 'supreme_math/term_collection'
require "supreme_math/function"
require "supreme_math/monomial"
require "supreme_math/polynomial"
require 'supreme_math/linear_function'
require 'supreme_math/quadratic_function'
require 'supreme_math/power_function'

module SupremeMath; end

