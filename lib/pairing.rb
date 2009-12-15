require 'pairing/match'
require 'fastercsv'

exposes = FasterCSV.read("private/solvants.csv")
nexposes = FasterCSV.read("private/temoins.csv")
