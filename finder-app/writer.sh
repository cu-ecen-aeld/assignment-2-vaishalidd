#!/bin/bash
#Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr

#Exits with value 1 error and print statements if any of the arguments above were not specified

#Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.


# Check both arguments are passed or not
if [ $# -ne 2 ]; then
	echo "pass two arguments as full file path & string"
	exit 1
fi
writefile=$1
writestr=$2
#echo $writefile

#Extract the folder path
	folder_path=$(dirname "$writefile")
	#echo $folder_path

#Extract the file name
	file_name=$(basename "$writefile")
	#echo $file_name


#Split the folder path into individual folders
IFS="/" read -ra folders <<< "$folder_path"

#Initialize the base path
base_path=""

#Loop through each folder in the path
for folder in "${folders[@]}"; do
    # Append the current folder to the base path
    base_path="$base_path/$folder"
    
    # Check if the folder exists
    if [ ! -d "$base_path" ]; then
        # Create the folder if it doesn't exist
        mkdir "$base_path"
        
        # Check if the folder creation was successful
        if [ $? -ne 0 ]; then
            echo "Failed to create folder: $base_path"
            exit 1
        fi
    fi
done

	if [ ! -f "$writefile" ]; then
		echo -n > $writefile
	        if [ $? -ne 0]; then
                	echo "Error: $writfile can not be created"
                	exit 1
		fi
		echo $writestr > $writefile
        fi





