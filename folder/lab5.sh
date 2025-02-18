#!/bin/bash

usage() {
echo "Usage: $0 {create|copy|move|delete} <source_file> [destination_file]"
exit 1
}

if [ "$#" -lt 2 ]; then
usage
fi
operation=$1
source_file=$2
destination_file=$3
case "$operation" in
    create)
    touch "$source_file"
    if [ $? -eq 0 ]; then
        echo "File '$source_file' created successfully."
    else
        echo "Error: Could not create file '$source_file'."
    fi
    ;;
copy)

    if [ -f "$source_file" ]; then
        cp "$source_file" "$destination_file"
        if [ $? -eq 0 ]; then
           echo "File '$source_file' copied to '$destination_file'
successfully."
           else
               echo "Error: Could not copy file '$source_file' to
'$destination_file'."
           fi
       else
          echo "Error: Source file '$source_file' does not exist."
       fi
       ;;
   move)

       if [ -f "$source_file" ]; then
           mv "$source_file" "$destination_file"
           if [ $? -eq 0 ]; then
                echo "File '$source_file' moved to '$destination_file'
 successfully."
             else
                 echo "Error: Could not move file '$source_file' to
'$destination_file'."
            fi
         else
             echo "Error: Source file '$source_file' does not exist."
         fi
         ;;
     delete)

         if [ -f "$source_file" ]; then
             rm "$source_file"
             if [ $? -eq 0 ]; then
                 echo "File '$source_file' deleted successfully."
             else
                echo "Error: Could not delete file '$source_file'."
             fi
          else
              echo "Error: File '$source_file' does not exist."
          fi
          ;;
  *)
         usag
         ;;
esac
