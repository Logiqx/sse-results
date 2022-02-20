## Todo

This document contains a list of ideas + plans left to implement for this project. Where applicable I have added links to items on GitHub.

I've broken them into "additional features" (medium-sized pieces of development), "minor tweaks" (minor changes / enhancements) and "data quality" (data refinements / report definition changes).

The next major priority is automatic generation of series results for UKWA and ISWC events held during Weymouth Speed Week.

I'll pick away at all of the the items listed below over the next few months. likely on an intermittent basis!



### Additional Features

The features below have been listed in order of priority.

#### UKWA + ISWC

The capability to generate competition "series" (ideally, 100% automatically) will benefit various organisations:

- UKWA - 2007 onwards but it should be noted that 2009 did not have any qualifying rounds.
- ISWC - 2008 to 2012 but it should be noted that 2009 did not have any qualifying rounds.
- WSW - 2004 had a series results which can potentially be replicated by generic "series" functionality.

#### Records

The record history of WSW is of particular interest.

- Requires a dedicated "Record" class to be created in the Python project.
- Rocket emoji 🚀 to indicate the occurrence of runs that were faster than the previous record.
  - When overall records are broken this should be made clear in the appropriate reports.
    - Craft Type and gender combinations make for 6 different types of records; e.g. "female windsurfer".
    - "Fastest overall" and "fastest female" (regardless of craft type) are a further 2 records.
  - New records can potentially occur several times in a single session; e.g. Thu and Fri in 2019.
  - Maybe add a "Blistering Runs" section at the top of the daily report pages?
- Create a page (or multiple pages) listing all known WSW records; past and present.

#### Prizes

Pages listing past prize winners over past years is also of interest, although not as high in priority as record histories.

- Prize histories - Gold Fleet, etc.
- Prize photos for past years:

#### Entrants

Once the "records" and "prizes" features have been implemented it would be nice to show more information for individual entrants.

- Session and event summaries for each entrant.
  - n.b. Should also create index pages for all entrants inside the sessions and event folders.
- Profile pages showing entrant participation across all available events, including hyperlinks to the event summaries.
- Can potentially report people who have been registered in the wrong fleet - e.g. amateur / gold / pro.

#### Charts

The final set of ideas for new features is some charts / visualisations for sessions and events.

- Scatter plots, showing runs during a session.
- Histograms, showing distributions of times during a session / event.
- Box and whisker charts, showing craft comparisons / session comparisons.

#### Excel Sync

Add an XLSX to CSV conversion to extract all of the entrant details for the event.

- Create Python script to do the initial conversion of the SSERPANT XLSX into CSV, rather than doing it manually.
- Create Python script to sync the latest XLSX to the CSV, rather than doing it manually.
  - Additional entrants
  - Additional GPS IDs / serials
  - Changes to craft type, status, "first timer" flag, entry type, gender, etc.



### Minor Tweaks

#### Navigation

The website requires some improved navigational features:

- Add an off-screen menu for site navigation?
  - Can easily use [Pushy](https://chrisyee.ca/pushy/) from another recent web project.

#### Additional Information

There are some trivial data items to add to several pages:

- Add timestamps to pages, perhaps using the timestamp of the GPSDATA / RUNDATA?
- Report the number of entrants + countries. Maybe add to all tables without rankings?
- Report number of runs; daily "all runs" and during the event. Maybe show for each person as well?
- Add event comments where applicable.
  - 2005 and 2008 have "top 3" limitations with the categories.
  - 2006 has ~20% of sailboard fleet with an unknown "status".

#### Aesthetics

The pages are relatively clean looking but some minor improvements might be worthwhile.

- Better banners; need to speak to Nick:
  - 2007, 2008, 2010, 2011 and 2012 are perfect
  - 2009 may exist somewhere?
  - 2013 is low resolution and there may be a better one somewhere?
  - The font for generic banners can be improved. What is the TTF font name?
- Page descriptions (browser tab names) should be improved for the main page and event pages.
  - "Weymouth Speed Week" or "Weymouth Speed Week 2021") would be better than "Events" or "Event".
- Craft type icons, maybe even group all of the reports based on craft type?
- Useful references:
  - https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Styling_tables
  - https://www.w3schools.com/cssref/css_selectors.asp
  - http://www.javascriptkit.com/dhtmltutors/cssmediaqueries2.shtml

#### Internal Changes

These items are entirely internal changes but the project would benefit from these internal tweaks (aka re-factoring).

- Use different jinja pages for the various index pages.
- Automatic handling of the letter 's' in prize comments - e.g. "3 sailboards" vs "1 sailboard".



### Data Quality

There are some further data quality checks that can be undertaken but they are not a high priority.

- Some of the report filters might benefit from minor tweaks:
  - BKSA trophy may require a "United Kingdom" filter? James Longmuir to confirm.
  - Decide if "lady sailboard" category should exclude youths in the earlier years; 2005 to 2010?
  - Decide if "fastest man" and "fastest lady" should also exclude youths?
- Check youth fleet ages in XLSX files - 2010 onwards.
  - This isn't critical because all of the the prize winners since 2005 are definitely correct.
- Remove runs going back up the course?
  - Suspect this only happened in 2010 when the first GPS event was run.
  - Originally identified by the presence of apparent "duplicate" runs based on times < 2 mins apart.
  - e.g. Neil Hardwick on 20 Oct 2010; 14:39:52 (90.0°) and 14:41:21 (278.4°).
    - This issue is also evident for Thomas Jundt on the same day in 2010
  - Possible identification when angle >= 135° different to the fastest runs on the course?
