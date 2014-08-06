module MatrixMath

    def scalarmultiply(num)
      m = Matrix.new
      1.upto(self.cardinatily[:rows]) do |row_index|
        row_m1 = self.rows(row_index)     
          row = []
          row_m1.each_with_index{|item, index| row << (item * num) }                
            m.add_row row
      end
      m
  end


=begin  def self.display(matrix1)
                  
    result=''
    i=0
    matrix1.raw_data.each do |row|
        row.map{|item|
           result=result+item.to_s
          i=i+1
          if(i!=matrix1.cardinatily[:rows])
           result=result+'&'  
            
          elsif(i==matrix1.cardinatily[:rows])
            result=result+'\\\\'
            i=0         
          end 
        } 
    end
    return result;  

  end
=end

  def formatize
    @result = ""
    @raw_data.each do |row|
      @result << row.map{|item| item.to_s }.join("&")
      @result << "\\\\"
    end
    @result
  end

  def negativeMatrix()
      m = Matrix.new
      1.upto(self.cardinatily[:rows]) do |row_index|
        row_m1 = self.rows(row_index)     
          row = []
          row_m1.each_with_index{|item, index| row << (item * -1) }               
            m.add_row row
      end
      m
  end      

  def add(m2)

    if self.cardinatily == m2.cardinatily
      m = Matrix.new
      1.upto(self.cardinatily[:rows]) do |index|
        row_m1 = self.rows(index)
        row_m2 = m2.rows(index)
        row = []
        row_m1.each_with_index { |item, index| row << (item + row_m2[index]) }
        m.add_row(row)
      end
      m
    else
      raise "Cardinality does not match"
    end
  end

  def subtract(m2)
    if self.cardinatily == m2.cardinatily
      m = Matrix.new
      1.upto(self.cardinatily[:rows]) do |index|
        row_m1 = self.rows(index)
        row_m2 = m2.rows(index)
        row = []
        row_m1.each_with_index{|item, index| row << (item - row_m2[index]) }
        m.add_row row
      end
      m
    else
      raise "Cardinality does not match"
    end
  end

  def multiply(m2)
    if self.cardinatily[:cols] == m2.cardinatily[:rows]
      m = Matrix.new
      1.upto(self.cardinatily[:rows]) do |row_index|
        resultant_row = []
        row_m1 = self.rows(row_index)
        1.upto(m2.cardinatily[:cols]) do |col_index|
          col_m2 = m2.cols(col_index)
          row = []
          row_m1.each_with_index{|item, index| row << (item * col_m2[index]) }
          resultant_row << row.inject(&:+)
        end
        m.add_row(resultant_row)
      end
      m
    else
      raise "Cardinality for multiplication does not match"
    end
  end
end
