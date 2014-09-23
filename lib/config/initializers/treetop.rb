require 'treetop'

Dir.glob('./lib/config/grammars/*.treetop').each do |grammar_file|
  Treetop.load grammar_file
end
