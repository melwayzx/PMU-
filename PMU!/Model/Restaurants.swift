//
//  Restaurants.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import Foundation

struct PlaceID {
    let place_id : String
    let category : [Int]
    let price_level : String
    let option : [String]
}


extension PlaceID{
    static func getPlaceID() -> [PlaceID] {
        return [
            PlaceID(place_id: "ChIJ2yq0eSqZ4jARv_s4evMWY-k", category: [0] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJMU_ZUymZ4jARJElgUCpqVrI", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJt3-3sC6Z4jAR01CFiBVAYkU", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJC_AesC6Z4jARBZZTQ2fKYnM", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","","",""]),
            PlaceID(place_id: "ChIJrTMDNSmZ4jARMgUvcPrygj4", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJb8qJLCyZ4jARy1hS5oiezcM", category: [0,1] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJFVMU6y6Z4jARfM273-HwetM", category: [0] , price_level: "฿฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJN38DNimZ4jARSRxflH5iITg", category: [0] , price_level: "฿฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJQ_sJ5AeZ4jARVePXckg2iso", category: [0,7] , price_level: "฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJd0oN2SmZ4jARvT7TiGUmDGs", category: [0,1] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJzfjgUimZ4jARhqiMz0lP5-M", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","","เราชนะ",""]),
            PlaceID(place_id: "ChIJAdXHIlCZ4jARf3Qbi5jgBoI", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","","เราชนะ",""]),
            PlaceID(place_id: "ChIJaaAoPCyZ4jARw38sYe2aGlA", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJkz1eKyyZ4jAR7I5pE5KhNzo", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJZZ3vFOSZ4jARctBSUl6fzAQ", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","","",""]),
            PlaceID(place_id: "ChIJjwbjky6Z4jARZTfbAktfTf8", category: [0] , price_level: "฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJ4frhLYGZ4jARoj36zuas1us", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJJ7VSuS6Z4jARAKhfhdhoLnM", category: [0,1] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJe_8_Ci6Z4jARqgBTNie9XqE", category: [0] , price_level: "฿฿฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJheWGiS6Z4jARVIWoVl0WSIM", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJxd9yDi6Z4jAReoWZr3Lc8i8", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ__yw-b2Z4jARVOrHLUSFNl4", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJ9x79aMSZ4jARP6cdrYMc1b4", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJwz1qhtWY4jAR5OdAm-4Truo", category: [0] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJt3mZ_SuZ4jARWTtL0mc9C6k", category: [0] , price_level: "฿฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJd0Byti6Z4jARBXVHTobQQP4", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJq55colWZ4jARnot9EOfN8zw", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJydtZFsae4jARedSv7QhfuV8", category: [0] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJSWhxfi6Z4jARhGQPscLf85g", category: [1] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJrVrrJsmZ4jARR8zp3d8gr8s", category: [1] , price_level: "฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJ2dRet9iZ4jARkUvvzcWC4Ms", category: [1] , price_level: "฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJwYZ7MiyZ4jARQ0848qaqNsU", category: [1] , price_level: "฿฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJb6g68PeZ4jARKbt4aYZDZ_U", category: [1] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJxzSmQUiZ4jARsTeBJTACSEY", category: [1] , price_level: "฿", option:["","","","",""]),
            PlaceID(place_id: "ChIJe41DF6eZ4jARmRV8PSxHNnI", category: [1] , price_level: "฿฿฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJ8f4epQSZ4jARMIJaZvIolPo", category: [1] , price_level: "฿", option:["","","","",""]),
            PlaceID(place_id: "ChIJt9rU2CmZ4jARHu_M9WzEbqU", category: [1] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJdQujdyqZ4jARQu129dUusV4", category: [1] , price_level: "฿฿฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJqcLIi9WY4jAR8SgSYftIqdw", category: [1] , price_level: "฿฿฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJSV288SuZ4jARtXsMuZuDawM", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJVx76-sqZ4jARgpV4NzFBaSY", category: [2] , price_level: "฿฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJm9gQvnSZ4jARc2nX3uu8zV0", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJn6mr8SuZ4jARgR4ky5lxUCA", category: [2] , price_level: "฿฿฿฿", option:["ที่ตอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJF8vvzC2Z4jAR-H4XOPM6O34", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJpZzMRaCZ4jAReLGmvuicsPc", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJfQslg0OZ4jARWG4SIfHnmEA", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJw2a0ey2Z4jARiT6iLcV1uyc", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJI5SshiqZ4jAROFXUX2C9KEg", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJDb3_siWZ4jARpbzBIXvjQdY", category: [2] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJFXOWnIaZ4jARFBCAovsubxI", category: [3] , price_level: "฿", option:["ที่จอดรถ","Grab Food","","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJryStSimZ4jARGZEmyIuG4iw", category: [3] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJBfLFym-Z4jARUuu-0bjiluQ", category: [3] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJPwRh_RiZ4jARzHx00K7yCYs", category: [3] , price_level: "฿฿", option:["","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJUYmXui6Z4jARq5I5Dkf6AWg", category: [4] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJpTNmpD-Z4jAR_8I9Bn4cTCA", category: [4] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ84bOyveZ4jARFMApl28plOk", category: [4] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJMWeJfdWY4jAR3HH-O_0RpOw", category: [4] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJCekMpC6Z4jARIa-Da1VeANg", category: [4] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJdwWLDimZ4jAR8ISnGK4eAD4", category: [4] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJIVgN0y2Z4jARlEC2k6-cOp0", category: [4] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ5bXlyLmZ4jAR0HTjfVOUhpY", category: [4] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJqVlFCCmZ4jARe4TfDpE9ktY", category: [5] , price_level: "฿฿", option:["ที่จอดรถ","","","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ7yli8SuZ4jARGVR4W7Cgg30", category: [5] , price_level: "฿฿฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJ25Uy_CuZ4jARCvoeRI3qhAo", category: [5] , price_level: "฿฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJKaXYjSqZ4jARmBnY4CFA7Cc", category: [5] , price_level: "฿฿฿", option:["ที่จอดรถ","","","เราชนะ",""]),
            PlaceID(place_id: "ChIJo6TBd7eZ4jAR2c525Q41VjA", category: [5] , price_level: "฿฿", option:["ที่จอดรถ","","","เราชนะ",""]),
            PlaceID(place_id: "ChIJ78j3giqZ4jARV4PCw7GpDzM", category: [5] , price_level: "฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJtwpWhNWY4jARU8ml_kYesvA", category: [5] , price_level: "฿฿฿", option:["ที่จอดรถ","","","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJG67y9CuZ4jARcb5YvP-oyoI", category: [6] , price_level: "฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJr68nqG6Z4jARmDaZ7-7bE7Y", category: [6,7] , price_level: "฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJaZ-Y0i2Z4jARcsHNCRjEncs", category: [6,7] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJvfdkGpuZ4jARnrFLi12_n5E", category: [6,7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJP5bHty6Z4jARxaTOk38cC30", category: [6,7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","","เราชนะ",""]),
            PlaceID(place_id: "ChIJ5UstNruZ4jAR8IvFsMS0bH8", category: [6,7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJcec0qhSZ4jAR082wMi4tfUA", category: [6] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ9ys9E3mZ4jARiCvLAIYW9c0", category: [6] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJ5wPjMSyZ4jAR0Tu6EY4VFHA", category: [6] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJ70pfKiOZ4jARIj_JgYiixZ0", category: [7] , price_level: "฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJo4mHLCyZ4jARl9-IbYtdypM", category: [7] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJpXGeBiyZ4jARlYnCsexYDyo", category: [7] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJxUvyPimZ4jARLtW4LnV6jT4", category: [7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJ6VQBfSqZ4jARJwDL2zdkyGI", category: [7] , price_level: "฿฿", option:["ที่จอดรถ","Grab Food","LINE MAN","",""]),
            PlaceID(place_id: "ChIJBzQaLiyZ4jARY64bmEOZSNc", category: [7] , price_level: "฿฿฿", option:["ที่จอดรถ","","","",""]),
            PlaceID(place_id: "ChIJMe-0CUWZ4jARJkl0yhZC23A", category: [7] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","",""]),
            PlaceID(place_id: "ChIJufQFlS6Z4jARChytiAWhVWY", category: [7] , price_level: "฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ",""]),
            PlaceID(place_id: "ChIJ0fbYciqZ4jARWl7f9PWUIwI", category: [7] , price_level: "฿฿", option:["ที่จอดรถ","","LINE MAN","เราชนะ","เรารักกัน"]),
            PlaceID(place_id: "ChIJx6VPjtWY4jAR_XiMfggo634", category: [7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","","",""]),
            PlaceID(place_id: "ChIJ8e0wniqZ4jARxvW3JxhlCfs", category: [7] , price_level: "฿", option:["ที่จอดรถ","Grab Food","LINE MAN","เราชนะ","เรารักกัน"])
        ]
    }
}

