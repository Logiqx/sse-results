# wsw-results

## Overview

This project has been created to produce the daily and weekly results for [Weymouth Speed Week](https://www.speedsailing.com/) 2022.

It supersedes the Excel macros (SSERPANT) that were used to generate the WSW results between 2010 and 2021.



## Features

This project has become rather more elaborate than originally planned and now has the following features:

- Generates Weymouth Speed Week (WSW) results for all years since 1998.
  - Daily and weekly reports.
  - Overall results (including craft types) and competitor profiles across multiple years.
  - Country flags will be shown where known for the competitors.
  - Prizes and records will be highlighted via emojis, where applicable.
  - Categories (e.g. Gold Fleet) have varied over the years and will be applied to historical results, where applicable.
- Records will be automatically detected + highlighted in reports and competitor profiles; historically and during an event.
  - Overall records
  - Records by craft type; Boat, Windsurfer, Kiteboard, etc.
  - Female records; overall, craft type, etc.
- Events such as the UKWA Speed Championship and ISWC competitions will automatically be scored where applicable.
  - Qualifying criteria will be applied, dependent on course type.
  - Results will be calculated based on the average of each competitors best runs.
  - Series discards will be applied, where applicable.
  - Tiebreak rules will be applied in the event of equal points.
- Heaps of data validation
  - The main goal is to get results produced quickly and reliably, without crashing due to minor data issues.
  - Data issues (registration data or run data) are automatically highlighted to the person running the reports.
  - Extensive unit testing has been implemented and is described later in this document.

Note: Some years had 200m, 300m and 700m courses which will be reported but kept separate from 500m records.



## Fuzzy Name Matching

Competitors often register with slight variations in how their name is written. For example:

- Ed Murrell, Eddie Murrell and Edward Murrell are the same person.
- Bob Spagnoletti and Robert Spagnoletti are the same person.
- Trevor Watford and Trevor Whatford are the same person, despite the typo.

This project implements a bespoke "fuzzy matching" algorithm to spot name variations and highlight them during report generation.

Editing the relevant entrants to make the names consistent across all years ensures that competitor profiles are as accurate as possible.

The bespoke "fuzzy matching" algorithm uses a combination of a nickname lookup, [Soundex](https://en.wikipedia.org/wiki/Soundex) and [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance).

The algorithm itself will not be explained in this document but the code can be found in [fuzzy.ipynb](python/fuzzy.ipynb) and [name.ipynb](python/name.ipynb).

There are 3 main reasons for building this "fuzzy matching" functionality as actual code:

1. The initial process of getting competitor names consistent between 1998 to 2021 was a lot less tedious and less prone to error.
2. The automated testing which compares newly generated results with past results can recognise the names in the original results.
3. All future competitors with "fuzzy matches" to names in previous years can be highlighted automatically by the reporting process.



## Unit Testing

The project includes pretty extensive unit testing within all of the Python modules:

- Core functionality for all of the classes / modules is tested during the software build.
- Results generated for past years (1988-2021) are automatically compared against what was originally published, where available:
  - Course results
  - Session results
  - Event results
- Results for the various categories in past years are also automatically checked where applicable - e.g. Master, Gold Fleet, etc.
- The "fuzzy name matching" algorithm is utilised when comparing results of past years against what was published on the website.

The above automated testing ensures that the software can be trusted for all past results and will accurately generate all future results.

