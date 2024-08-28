current_dir=$(pwd)
is_n=$(find $current_dir -name "*.txt" | grep -v "old_")
if [[ -z "$is_n" ]]
	then
		echo "No more files to edit"
		exit 1
fi

n=$(find $current_dir -name "*.txt" | grep -v "old_" | xargs -n 1 basename | wc -l)

while [ $n != 0 ]
do
	file=$(find $current_dir -name "*.txt" | grep -v "old_" | xargs -n 1 basename | sed -n 1p)
	mv "$file" "old_$file"
	((n--))
done

if [[ $n -eq 0 ]]
	then
		echo "Completed successfully, No more files to edit"
fi
