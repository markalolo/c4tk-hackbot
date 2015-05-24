# Description:
#   Bible Me
#
# Dependencies:
#   None
#
# Commands:
#   bible me - Return random bible verses
#
# Author:
#   markalolo

verses = [
  "Dear friends, I want you to understand well that the Lord God is willing to wait a long time to judge the people in the world! How much time passes before the Lord God judges the people in the world does not matter to him! He considers that one day passes no more quickly than a thousand years, and he also considers that a thousand years pass as quickly as one day passes to us! - 2 PETER 3:8",
  "In the sky the sun will appear dark to people and the moon will appear red to them. Those things will happen before I, the Lord God, will come to judge everyone. - ACTS 2:20",
  "They said these because they had seen Paul walking around in Jerusalem with Trophimus, who was a non-Jew. Their laws did not permit non-Jews to be in the Temple, and they thought that Paul had brought Trophimus into the Temple courtyard that day. - ACTS 21:29",
  "Turn away from your evil ways, because I perceive that you are extremely envious of us, and you are a slave of your continual desire to do evil! - ACTS 8:23",
  "he saved us by washing us clean on the inside, giving us a new birth, and making us new by the Holy Spirit. He did not save us because we do good things, but he saved us because he is merciful. - TITUS 3:5",
  "Now, my fellow believers, you have become children of God because you believed in what God promised to give to us. You are like Isaac, who was born because Abraham had believed in what God promised to give to him. - GALATIANS 4:28",
  "So when anyone comes to you who teaches something different from what Christ taught, do not welcome him into your homes! Do not encourage him by greeting him or wishing him well in any way! - 2 JOHN 1:10",
  "We tell you this because you yourselves know that you should behave like we behaved. We did not merely sit around without working while we were living among you. - 2 THESSALONIANS 3:7",
  "Some have become like her children by accepting what she teaches, and I will certainly kill them. Then all the groups of believers will learn that I am the one who finds out what everyone thinks and desires. I will reward each of you according to what you have done. - REVELATION 2:23",
  "Greet for me all the believers--they all belong to God! The believers with me greet you, as well. - PHILIPPIANS 4:21",
  "And even your parents and brothers and other relatives and friends will betray you, and they will kill some of you. - LUKE 21:16",
  "I will tell you how God has shown us that he loves us: He sent his only Son to live on the earth to enable us to live eternally because of him. - 1 JOHN 4:9",
  "So, because of what God has done, no longer is each of you like a slave. Instead, each of you is a child of God. Since each of you is now God's child, God will also give you all that he has promised. God himself will do it! - GALATIANS 4:7",
  "I will rejoice because I know that God will free me from prison. He will do this because you are praying for me and because the Spirit of Jesus Christ is helping me. - PHILIPPIANS 1:19",
]

module.exports = (robot) ->

  robot.hear /bible me/i, (msg) ->
    msg.send msg.random verses
