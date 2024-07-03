if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent() --[[@as PhotonLibraryComponent]]

COMPONENT.Author = "Photon"
COMPONENT.Credits = {
	Vehicle = "SGM",
	Code = "Schmal"
}

COMPONENT.PrintName = "2015 Charger"

COMPONENT.IsVirtual = true

COMPONENT.Templates = {
	["Mesh"] = {
		Mesh_static = {
			Model = "models/supermighty/mesh/2015charger_lights.mdl",
			IntensityGainFactor = 10,
			IntensityLossFactor = 10,
            Scale = 1.0,
		},
    },
    ["2D"] = {
		Running = {
			Width = 1,
			Height = 1,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/bulb_detail.png").MaterialName,
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/bulb_shape.png").MaterialName,
			Scale = 0.2
		}
	},
    ["Projected"] = {
		Projected = {
			FOV = 70,
			Texture = "effects/flashlight/soft",
			NearZ = 4,
			FarZ = 2000,
			Brightness = 3,
			IntensityGainFactor = 12,
			IntensityLossFactor = 6,
			DeactivationState = "OFF",
		},
	},
    ["DynamicLight"] = {
		Dynamic = {
			Brightness = 1,
			Size = 30,
			InnerAngle = 0,
			OuterAngle = 0,
		}
	},
}
COMPONENT.ElementStates = {
    ["Mesh"] = {
        ["~OFF"] = { Intensity = 0, IntensityTransitions = false },
        ["~OFF2"] = { Intensity = 0, IntensityTransitions = true },
		["BL"] = {
			Inherit = "B",
			Intensity = 10000
		},
		["~SW"] = {
			Inherit = "SW",
			Intensity = 0.9,
            IntensityLoss = 60,
			IntensityTransitions = true,
		},
        ["~R"] = {
            BloomColor = PhotonColor( 255, 60, 0 ):Blend( red ):GetBlendColor(),
		    DrawColor = PhotonColor( 255, 60, 0 ):Blend( red ):GetBlendColor(),
            Inherit = "R",
            Intensity = 1,
            IntensityLoss = 100,
            IntensityTransitions = true,
        },
    },
    ["Projected"] = {
        ["~OFF"] = { Intensity = 0, IntensityTransitions = false },
        ["~OFF2"] = { Intensity = 0, IntensityTransitions = true },
		["~SW"] = {
			Inherit = "SW",
			Intensity = 1,
            IntensityLoss = 60,
			IntensityTransitions = true,
		},
        ["~SW2"] = {
			Inherit = "R",
			Intensity = 1,
            IntensityLoss = 1,
			IntensityTransitions = true,
		},
    },
}
COMPONENT.Elements = {
    [1] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/1", DrawMaterial = "photon/common/glow_gradient_a", },
    [2] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/2", DrawMaterial = "photon/common/glow_gradient_a", },
    [3] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/3", DrawMaterial = "photon/common/glow_gradient_a", },
    [4] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/4", DrawMaterial = "photon/common/glow_gradient_a", },
    [5] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/5", DrawMaterial = "photon/common/glow_gradient_a", },
    [6] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/6", DrawMaterial = "photon/common/glow_gradient_a", },
    [7] = { "Mesh_static", Vector( 0, -0.15, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/7", DrawMaterial = "photon/common/glow", },
    [8] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/8", DrawMaterial = "photon/common/glow", },
    [9] = { "Mesh_static", Vector( 0, -0.5, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/9", DrawMaterial = "photon/common/glow", },
    [10] = { "Mesh_static", Vector( 0, -0.5, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/10", DrawMaterial = "photon/common/glow", },
    [11] = { "Mesh_static", Vector( 0, -0.5, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/11", DrawMaterial = "photon/common/glow_gradient_a", },
    [12] = { "Mesh_static", Vector( 0, -0.5, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/12", DrawMaterial = "photon/common/glow_gradient_a", },
    [13] = { "Mesh_static", Vector( 0, -0.5, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/13", DrawMaterial = "photon/common/glow_gradient_a", },
    [14] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/14", DrawMaterial = "photon/common/glow_gradient_a", },
    [15] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/15", DrawMaterial = "photon/common/glow_gradient_a", },
    [16] = { "Mesh_static", Vector( 0, -0.1, 0 ), Angle( 0, 0, 0 ), "mighters/mesh/16", DrawMaterial = "photon/common/glow_gradient_a", },

}

COMPONENT.StateMap = "[~W] 1 2 5 6 9 10 11 12 [A] 3 4 [R] 7 8 13 14 15 16"
 
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Segments = {
    ["DRL"] = {
        Frames = {
            [1] = "1 2",
            [2] = "1",
            [3] = "2",
        },
        Sequences = {
            ON = {
                1
            },
            FLASH = sequence():Alternate( 2, 3, 8 ),
        }
    },
    ["DRL_Rear"] = {
        Frames = {
            [1] = "14 15 16",
            [2] = "14 15",
            [3] = "16",
        },
        Sequences = {
            ON = {
                1
            },
            FLASH = sequence():TripleFlash( 2, 3, 5)
        }
    },
    ["Turn_Left"] = {
        Frames = {
            [1] = "4",
        },
        Sequences = {
            ON = sequence():Alternate( 1, 0, 10 ),
        }
    },
    ["Turn_Right"] = {
        Frames = {
            [1] = "3",
        },
        Sequences = {
            ON = sequence():Alternate( 1, 0, 10 ),
        }
    },
    ["Headlight"] = {
        Frames = {
            [1] = "5 6",
        },
        Sequences = {
            ON = {
                1
            }
        }
    },
    ["Turn_Rear_Left"] = {
        Frames = {
            [1] = "7",
        },
        Sequences = {
            ON = {
                1
            },
            Turn = sequence():Alternate( 1, 0, 10 ),
        }
    },
    ["Turn_Rear_Right"] = {
        Frames = {
            [1] = "8",
        },
        Sequences = {
            ON = {
                1
            },
            Turn = sequence():Alternate( 1, 0, 10 ),
        }
    },
    ["Reverse"] = {
        Frames = {
            [1] = "9 10",
        },
        Sequences = {
            ON = {
                1
            }
        }
    },
    ["Brake_Middle"] = {
        Frames = {
            [1] = "13",
        },
        Sequences = {
            ON = {
                1
            }
        }
    },
}

COMPONENT.Inputs = {
   ["Vehicle.Lights"] = {
       ["PARKING"] = {
        DRL = "ON",
       },
       ["HEADLIGHTS"] = {
        DRL = "ON",
        DRL_Rear = "ON",
        Headlight = "ON",
       },
       ["DRL"] = {
        DRL = "ON",
    }
   },
   ["Vehicle.Brake"] = {
    ["BRAKE"] = {
        Turn_Rear_Left = "ON",
        Turn_Rear_Right = "ON",
        Brake_Middle = "ON",
        },
    },
    ["Vehicle.Signal"] = {
        ["LEFT"] = {
            Turn_Left = "ON",
            Turn_Rear_Left = "Turn",
        },
        ["RIGHT"] = {
            Turn_Right = "ON",
            Turn_Rear_Right = "Turn",
        },
        ["HAZARD"] = {
            Turn_Left = "ON",
            Turn_Right = "ON",
            Turn_Rear_Left = "Turn",
            Turn_Rear_Right = "Turn",
        },
    },
    ["Vehicle.Transmission"] = {
        ["REVERSE"] = {
            Reverse = "ON",
        }
    },
    ["Emergency.Warning"] = {
        ["MODE3"] = {
            DRL = "FLASH",
            DRL_Rear = "FLASH",
        }
    },
}