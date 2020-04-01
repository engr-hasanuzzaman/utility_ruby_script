require 'creek'
file_name = 'seedstar voting list 6.xlsx';
file_path = File.join(File.dirname(__FILE__), file_name);
creek = Creek::Book.new file_path
sheet = creek.sheets[0]

file_no = 1
sheet.rows.each_slice(2000) do |s|
  File.open("#{file_name}_#{file_no}.txt", 'a') {|f| f.write("[") }
  s.each do |row|
    File.open("#{file_name}_#{file_no}.txt", 'a') {|f| f.write("'#{row.values.first }', ") }
  end
  File.open("#{file_name}_#{file_no}.txt", 'a') {|f| f.write("]") }
  file_no += 1
end

