colors =
    "cssdcz": \#f29400
    "ceska.piratska.strana": \#333333
    "svobodni": \#005B46
    "stranazelenych": \#00AD00
    "anobudelip": \#282560
    "kducsl": \#EEE03E
    "veciverejne": \#84d0f1
    "ods.cz": \#006ab3
    "top09cz": \#7c0042
    "hnutiusvit.cz": \#ffd91f
    "komunistickastranacechamoravy": \#ce0000
    "stranales.cz ": \#76ce29
new Tooltip!watchElements!
volby =
    *   time: 1350086400000, name: "Zastupitelské a senátní volby 12. &ndash; 13. 10. 2012" #"2012-10-13"
    *   time: 1382745600000, name: "Parlametní volby 25. &ndash; 26. 10. 2013" #"2013-10-26"
    *   time: 1357948800000, name: "Prezidentské volby 11. &ndash; 12. 1. 2013" #"2013-01-12"

container = d3.select ig.containers.base
weekWidth = 2_px
firstTime = 1325376000000
volby.forEach -> it.week = Math.floor (it.time - firstTime) / (7 * 86400 * 1000)
date = new Date!
x = (d, week) -> "#{week * weekWidth}px"
y = -> it * 0.8
container.selectAll \div.party .data ig.data.parties .enter!append \div
    ..attr \class \party
    ..append \h2
        ..html -> "#{it.name}"
    ..selectAll \div.volby .data volby .enter!append \div
        ..attr \class \volby
        ..style \left -> x null it.week
        ..attr \data-tooltip -> it.name
    ..selectAll \div.month .data (.weeks) .enter!append \div
        ..attr \class \month
        ..style \left x
        ..style \width "#{weekWidth}px"
        ..style \height ->"#{y it}px"
        ..style \background (d, i, ii) -> colors[ig.data.parties[ii].party]
        ..attr \data-tooltip (d, i) ->
            date.setTime firstTime + i * 7 * 86400 * 1000
            "Týden od #{date.getDate!}. #{date.getMonth! + 1}. #{date.getFullYear!}: #{d} příspěvků"
