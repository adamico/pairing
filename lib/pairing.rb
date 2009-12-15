require 'pairing/cas'
require 'fastercsv'

exposes = FasterCSV.read("solvants.csv")
nexposes = FasterCSV.read("temoins.csv")

