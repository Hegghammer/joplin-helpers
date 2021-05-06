# Joplin helper scripts

<img align="left" width="20" height="20" src="joplin_logo.jpeg">

This is a repository of helper scripts for the [Joplin](https://joplinapp.org) note-taking app.

## Email to Joplin

After moving from Evernote to Joplin, the only thing I really missed was the ability to email into my note collection. But the great thing about Joplin is that it's scriptable, and with `./scripts/emails_to_joplin.R` you can forward messages to a Gmail account and then have the script file those emails (with attachments) into Joplin for you.

The script requires a few things, notably:
- A functioning R installation.
- A dedicated Gmail account to serve as a transit point for emails to be filed to Joplin.
- A json file with credentials to this gmail account, with the file path stored as an environmental variable (e.g. "JOPLIN_GMAIL_AUTH") in the .Renviron file.
- A functioning installation of Joplin's [command line interface](https://joplinapp.org/terminal/).
- A host notebook to serve as inbox in your Joplin repository. I call mine "000_inbox", but you can adapt the script to your preferences.

The script can be automated as a cronjob/scheduled task to run as often as you like. For example, to run it at 15-minute intervals from 9am to 9pm on a Linux machine, add `*/15 9-21 * * * Rscript <your local path>/emails_to_joplin.R` to your crontab.

To email to Joplin, simply clone this repository and configure your email and .Renviron file as indicated above. Leave the empty `./transit` directory, as it serves a purpose in the script.

## Bulk export from Evernote

The move from Evernote to Joplin is made difficult by Evernote (> 6.25) not allowing bulk export of notebooks. But it can be automated with a .cmd script. A kind soul in the Evernote discussion forum wrote [this script](https://discussion.evernote.com/forums/topic/124273-how-to-batch-file-script-to-backup-evernote-to-google-drive/) which I have preserved here as `./scripts/bulk_export_from_evernote.cmd`.

## Bulk import to Joplin

Since the GUI version of Joplin does not allow bulk imports of Evernote notebooks, I wrote a tiny bash script (`./scripts/bulk_import_evernote_to_joplin.sh`) to do it via the Joplin CLI.

## Contribute

This is all work in progress, so please send corrections and suggestions via email or on the issues page.
