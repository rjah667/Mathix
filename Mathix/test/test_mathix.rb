require 'rubygems'
require 'bundler/setup'
require 'Mathix'
require 'test/unit'


class MathixTest < Test::Unit::TestCase
        def test_add
                #m3=Matrix.new([[2,4,8],[2,8,12],[8,10,18]])
                m1=Matrix.new([[1,2,4],[1,4,6],[4,5,9]])        
                m2=Matrix.new([[1,2,4],[1,4,6],[4,5,9]])
                #assert_equal m3.to_s,m1.add(m2).to_s
                puts m1.multiply(m2)
        end
end
