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

verses = "https://bible-random.herokuapp.com/"

module.exports = (robot) ->
  regex = /bible me/i

  robot.hear regex, (msg) ->
    msg.reply verses
