# 1. hello_world/
# Print "hello world".

echo "hello world"

# 2. current_working_directory/
# Print the current working directory.

pwd

# 3. list_files/
# List all of the files in the current directory, one file per line.

ls -1

# 4. print_file_contents/
# There is a file named "access.log" in the current directory. Print the contents.

cat access.log

# 5. last_lines
# Print the last 5 lines of "access.log".

tail -5 access.log

# 6. find_string_in_a_file/
# There is a file named "access.log" in the current working directory. Print all the lines in this file that contains the string "GET".

grep -e "GET" access.log

# 7. find_tabs_in_a_file/
# How many lines contain tab chacters in the file named "file-with-tabs.txt" in the current directory

grep "	" file-with-tabs.txt | wc -l

# 8. search_for_files_containing_strings/
# Print all files, one per line (not the path, just the file) that contain the string "500".

grep -l "500" *

# 9. search_for_files_by_extension/
# Print the relative file paths, one path per line for all filenames that start with "access.log" in the current directory.

find access.log*

# 10. search_for_string_in_files_recursive/
# Print all matching lines (without the filename or the file path) in all files under the current directory that starts with "access.log" that contain the string "500". Note that there are no files named "access.log" in the current directory, you willl need to search recursively.

grep -h "500" `find . -name 'access.log*'`

# 11. extract_ip_addresses/
# Extract all IP addresses from files that start with "access.log" printing one IP address per line.

grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' `find . -name 'access.log*'`

# 12. delete_files/
# Delete all of the files in this challenge directory including all subdirectories and their contents.

find . -delete

# 13. count_files/
# Count the number of files in the current working directory. Print the number of files as a single integer.

ls -1 | wc -l

# 14. simple_sort/
# Print the contents of access.log sorted.

sort access.log

# 15. count_string_in_line/
# Print the number of lines in access.log that contain the string "GET".

grep "GET" access.log | wc -l

# 16. split_on_a_char/
# The file split-me.txt contains a list of numbers separated by a ';' character. Split the numbers on the ';' character, one number per line.

grep -o -e '[0-9]\+' split-me.txt

# 17. print_number_sequence/
# Print the numbers 1 to 100 separated by spaces.

seq -s ' ' 1 100

# 18. remove_files_with_a_dash/
# There are some files in this directory that start with a dash in the filename. Remove those files.

rm -f `find . -name '-*'`

# 19. remove_files_with_extension/
# There are files in this challenge with different file extensions. Remove all files with the .doc extension recursively in the current working directory.

find . -name '*.doc' -delete

# 20. remove_files_without_extension/
# There are files in this challenge with different file extensions. Remove all files without the .txt and .exe extensions recursively in the working directory.

find . -type f -not -name "*.txt" -and -type f -not -name "*.exe" -delete

# 21. replace_text_in_files/
# This challenge has text files (with a .txt extension) that contain the phrase "challenges are difficult". Delete this phrase recursively from all text files. Note that some files are in subdirectories so you will need to search for them.

find . -path "*.txt" -exec sed -i "s/challenges are difficult//g" '{}' \;

# 22. sum_all_numbers/
# The file sum-me.txt have a list of numbers, one per line. Print the sum of these numbers. - GRAMMATICAL TYPO, remember to report :+1:

awk '{ sum += $1 } END { print sum }' sum-me.txt

# 23. just_the_files/
# Print all files in the current directoy recursively without the leading directory path.

find . -type f -printf "%f\n"

# 24. remove_extensions_from_files/
# Remove the extension from all files in the current directory recursively. - BUG, can be solved by deleting all files, remember to report :+1

find . -name '*.*' -type f | while read NAME ; do mv "${NAME}" "${NAME%.*}" ; done

# 25. replace_spaces_in_filenames/
# The files in this challenge contain spaces. List all of the files (filenames only) in the current directory but replace all spaces with a '.' character.

ls -1 | while read NAME ; do echo ${NAME// /.} ; done

# 26. files_starting_with_a_number/
# There are a mix of files in this directory that start with letters and numbers. Print the gilenames (just the filenames) of all files that start with a number recursively in the current directory

find . -type f -name '[0-9]*' - printf '%f\n'

# 27. print_nth_line/
# Print the 25th line of the file faces.txt

sed -n "25p" faces.txt

# 28. remove_duplicate_lines/
# Print the file faces.txt but only print the first instance of each duplicate line, even if the duplicates don't appear next to each other. Note that order matters so don't sort the lines before removing duplicates.

awk '!seen[$0]++' faces.txt

# 29. corrupted_text/
# The following excerpt from War and Peace is saved to the file 'war_and_peace.txt':
# She is betraying us! Russia alone must save Europe. Our gracious sovereign recognizes his high vocation and will be true to it. That is the one thing I have faith in! Our good and wonderful sovereign has to perform the noblest role on earth, and he is so virtuous and noble that God will not forsake him. He will fulfill his vocation and crush the hydra of revolution, which has become more terrible than ever in the person of this murderer and villain!
# The file however has been corrupted, there are random '!' marks inserted throughout. Print the original text.

cat war_and_peace.txt | tr -s ! | sed "s/ !/ /g" | sed "s/!\([^ ]\)/\1/g" | sed "s/! \([a-z]\)/ \1/g" | sed "s/\([[:punct:]]\)!/\1/g"

# 30. print_common_lines/
# access.log.1 and access.log.2 are http server logs. Print the IP addresses common to both files, one per line.

grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' access.log.1 | sort > sort1 ; grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' access.log.2 | sort > sort2 ; comm -1 -2 sort1 sort2
