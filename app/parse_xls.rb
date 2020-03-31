require 'creek'
file_name = 'Sumon.xlsx';
file_path = File.join(File.dirname(__FILE__), file_name);
creek = Creek::Book.new file_path
sheet = creek.sheets[0]

sheet.rows.each do |row|
  # puts # => {"A1"=>"Content 1", "B1"=>nil, "C1"=>nil, "D1"=>"Content 3"}
  File.open("#{file_name}.out", 'a') {|f| f.write("'#{row.values.first }', ") }
end

