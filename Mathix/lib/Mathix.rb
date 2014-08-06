require 'Mathix/Matrix_Math.rb'
class Matrix
  include MatrixMath
  
  attr_accessor :raw_data
        
        
  def initialize(params=nil)    
    @raw_data = []
    extract_params(params) unless params.nil?
  end

  def to_s
    result = ""
    @raw_data.each do |row|
      result << row.map{|item| item.to_s.rjust(4) }.join(" ")
      result << "\n"
    end 
    result << "\n"  
    result
  end

  def rows(index=nil)
    index.nil? ? @raw_data : @raw_data[index-1]
  end

  def cols(index=nil)
    if index.nil? 
      cols = []
      max_cols = @raw_data[0].length - 1

      0.upto(max_cols) do |col_index|       
        cols << @raw_data.map{|row| row[col_index] }
      end
      cols
    else
      @raw_data.map{|row| row[index-1] }
    end
  end

  def add_row(row)
    if @raw_data.size == 0
      @raw_data << row
    elsif row.size == @raw_data[0].size
      @raw_data << row
    else
      raise "New row size does not match"
    end
  end

  def add_column(col)
    if @raw_data.size > 0 
      @raw_data.each_with_index do |row, index|
        row << col[index]
      end
    else
      col.map{|item| @raw_data << [item] }
    end
  end

  def cardinatily
    @raw_data.size == 0 ? {rows: 0,cols: 0} : {rows: @raw_data.size,cols: @raw_data[0].size}
  end

  def self.matrix2string(matrix)
        result = "["
        @count=0
        matrix.raw_data.each do |row|
          @count +=1
          result << row.map{|item| item.to_s}.join(" ")
          if(@count!=matrix.raw_data.size)
            result << " | "
          end
        end
        result=result+"]"
        result=result.tr('[]','')
        result
    end
  
  #-----------------------------------------------------------------------------------------

  
  #-----------------------------------------------------------------------------------------

  private
  def extract_params(params)
    # [[1,2,4],[1,4,6],[4,5,9]]
    if params.is_a? Array
      @raw_data = params
    # 1 2 3 | 4 5 6 | 7 8 9
    elsif params.is_a? String
      @raw_data = params.split("|").map{|row| row.split(" ").map!{|num| num.strip.to_i} }   
    end
  end
  
  
end
