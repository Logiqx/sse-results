# Configuration

## Background

The legacy Excel configuration and report definitions were initially converted from CSV to JSON using an online tool:

- [Convert CSV to JSON](https://www.convertcsv.com/csv-to-json.htm)

The only non-default option selected was 'Do Not output field/value pair if value is empty'.

Fluff was removed post-conversion and the report definitions were amended to ensure greater consistency.



## Structure

This folder contains a number of configuration files to generate results for Weymouth Speed Week (WSW).

The configuration files are an evolution of the Excel spreadsheet that was used up to and including WSW 2021.

| Filename         | Description |
| ---------------- | ----------- |
| reports/\*        | Folder containing report definitions |
| config.json      | Main configuration |
| countries.json   | Lookup for country flags (CSS sprites) |
| README.md        | This file |
| stats.json       | Statistical summary definitions - yet to be defined |


