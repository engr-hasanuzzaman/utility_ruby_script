require 'creek'
file_name = 'Sumon.xlsx';
file_path = File.join(File.dirname(__FILE__), file_name);
creek = Creek::Book.new file_path
sheet = creek.sheets[0]

File.open("#{file_name}.out", 'a') {|f| f.write("[") }
sheet.rows.each do |row|
  File.open("#{file_name}.out", 'a') {|f| f.write("'#{row.values.first }', ") }
end
File.open("#{file_name}.out", 'a') {|f| f.write("]") }
