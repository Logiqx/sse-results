## Tricks and Tips

All of the configuration files for this project are either JSON or CSV.

It is possible to search them efficiently from the command prompt using tools such as [jq](https://stedolan.github.io/jq/) and [csvkit](https://csvkit.readthedocs.io/en/latest/).




### jq

Install "jq" with `sudo apt-get install python3-csvkit`

List of the the groupings being reported:
```shell
$ jq '.Event.Name, .Entrants.Grouping' events/*/config/event.json
```

List of the the craft types allowed each year:
```shell
$ jq '.Event.Name, .Entrants."Craft Type"' events/*/config/event.json
```



### csvkit

Install "csvkit" with `sudo apt install python3-csvkit`

List all of the GT-31 IDs in a specific year:
```shell
$ csvcut -c "GT31 ID" events/2014/config/entrants.csv
```

List all of the tally numbers in a specific year, derived from GT-31 IDs:
```shell
$ csvcut -c "GT31 ID" events/2014/config/entrants.csv | sed 's/[A-Za-z]//g' | sort -n
```

List all members of a grouping such as "Portland Pirates" in a specific year:
```shell
$ csvgrep -c "Grouping" -m "Portland Pirates" events/2021/config/entrants.csv | csvcut -c "First Name,Family Name"
```

List all members of a grouping such as "Portland Pirates" across all years since 2010:
```shell
$ GROUPING="Portland Pirates"
$ for CSV in events/20[12]?/config/entrants.csv
do
  csvgrep -c "Grouping" -m "$GROUPING" $CSV | csvcut -c "First Name,Family Name"
done | grep -v "First Name,Family Name" | sort -u
```
