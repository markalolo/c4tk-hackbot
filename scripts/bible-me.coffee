# Description:
#   Hubot return Bible verses
#
#
# Dependencies:
#   None
#
# Commands:
#   bible me - Return random Bible Verses
#
# Author:
#   markalolo

verses = """
<!DOCTYPE html>
<html>
<head>
    <title>Random Verse</title>
</head>
<body>

<h1>Random Verse from UnfoldingWord</h1>
<p id="verse" style="font-weight: bold;">Please wait, loading...</p>
<p>Refresh the page for another verse.</p>
<p id="source">Source: <a href="https://door43.org/en/dev/api/unfoldingword">UnfoldingWord API</a></p>


<script>

getCatalog();

function getCatalog() {
    var xmlhttp = new XMLHttpRequest();
    var url = "https://api.unfoldingword.org/uw/txt/2/catalog.json";
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            data = JSON.parse(xmlhttp.responseText);
            processCatalog(data);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function processCatalog(data) {
    catalog = data["cat"];
    for (i = 0; i < catalog.length; i++) {
        entry = catalog[i];
        if (entry["slug"] == "bible") {
            processBible(entry);
            break;
        }
    }
}

function processBible(data) {
    languages = data["langs"]
    for (i = 0; i < languages.length; i++) {
        entry = languages[i];
        if (entry["lc"] == "en") {
            processEnglishBible(entry);
            break;
        }
    }
}

function processEnglishBible(data) {
    versions = data["vers"]
    for (i = 0; i < versions.length; i++) {
        entry = versions[i];
        if (entry["slug"] == "udb") {
            processEnglishDynamicBible(entry);
            break;
        }
    }
}

function processEnglishDynamicBible(data) {
    toc = data["toc"];
    bookNum = Math.floor(Math.random() * toc.length);
    book = toc[bookNum];
    src = book["src"];
    processBook(src);
}

function processBook(src) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            processUSFMDocument(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", src, true);
    xmlhttp.send();
}

function processUSFMDocument(doc) {
    var currentBook = "";
    var currentChapter = "";
    var verses = [];
    var lines = doc.split("\n");
    for (i = 0; i < lines.length; i++) {
        line = lines[i];
        indexOfFirstSpace = line.indexOf(" ");
        if (indexOfFirstSpace == -1) {
            continue;
        }
        dataType = line.substring(0, indexOfFirstSpace);
        if (dataType == "\\v") {
            indexOfSecondSpace = line.indexOf(" ", indexOfFirstSpace + 1);
            verseNumber = line.substring(indexOfFirstSpace + 1, indexOfSecondSpace);
            verses.push({"book": currentBook, "chapter": currentChapter, "verse": verseNumber, "text": line.substring(indexOfSecondSpace + 1)});
        } else if (dataType == "\\c") {
            currentChapter = line.substring(indexOfFirstSpace + 1);
        } else if (dataType == "\\h") {
            currentBook = line.substring(indexOfFirstSpace + 1);
        }
    }
    verseNum = Math.floor(Math.random() * verses.length);
    verse = verses[verseNum];
    document.getElementById("verse").innerHTML = verse["text"] + " - " + verse["book"] + " " + verse["chapter"] + ":" + verse["verse"];
}

</script>
</body>
</html>
"""

module.exports = (robot) ->
  regex = /bible me/i

  robot.hear regex, (msg) ->
    msg.reply verses
