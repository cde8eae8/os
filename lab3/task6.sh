cat task5.out | awk -F: '
{
	cur = $2; prev = $2
	sum = 0; n = 0;
 	while (cur == prev) {
		n++;
		sum += $3;
		print $0
		if (getline == 0) {
			break;
		}
		prev = cur
		cur = $2
	}
	printf "Average_Sleeping_Children_of_ParentID=%d is %f [%f / %d]\n", $2, sum/n, sum, n;
}'

