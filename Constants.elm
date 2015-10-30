module Constants where

import Color exposing (Color)


-- s : slot
sWidth : number
sWidth = 30

sHeight : number
sHeight = 15


-- af : anonymouts function
afFill : Color
afFill = Color.grey

afSlotOffset : number
afSlotOffset = 30


-- nf : named function
nfFill : Color
nfFill = Color.lightBlue

nfTextFill : Color
nfTextFill = Color.black

nfHeight : number
nfHeight = 50

nfConnectionOffset : number
nfConnectionOffset = 20

nfConnectionGroupWidth : number
nfConnectionGroupWidth = sWidth + nfConnectionOffset
