//
//  MapView.swift
//  LiveTramsMCR (iOS)
//  Created by shaundon (https://gist.github.com/shaundon/00be84deb3450e31db90a31d5d5b7adc)
//  Modified
//

import SwiftUI
import MapKit
import OrderedCollections

struct ExampleRouteCoordinates {
    static let exampleCoordinates: [[Double]] = [
        [ -2.2970957346, 53.590958632 ],
                [ -2.2972504176, 53.5907058363 ],
                [ -2.2975205991, 53.5902640601 ],
                [ -2.2977644036, 53.5899134547 ],
                [ -2.2981070581, 53.5894693295 ],
                [ -2.2985254319, 53.588953664 ],
                [ -2.2986996242, 53.5887489854 ],
                [ -2.2988504039, 53.5885985379 ],
                [ -2.2989527049, 53.5885166941 ],
                [ -2.2990862899, 53.5884195814 ],
                [ -2.2992050285, 53.5883358984 ],
                [ -2.2993149437, 53.5882735309 ],
                [ -2.2994827689, 53.5881906141 ],
                [ -2.2996330074, 53.5881245495 ],
                [ -2.2998009479, 53.5880602469 ],
                [ -2.2999527908, 53.5880075615 ],
                [ -2.3001193411, 53.5879582635 ],
                [ -2.3003536667, 53.5878928849 ],
                [ -2.3010697462, 53.587753412 ],
                [ -2.3012985131, 53.5877118557 ],
                [ -2.301641201, 53.5876303001 ],
                [ -2.3019244882, 53.5875487142 ],
                [ -2.3022146889, 53.5874601804 ],
                [ -2.3025105815, 53.5873502585 ],
                [ -2.3028080476, 53.587232422 ],
                [ -2.3030933528, 53.5871021218 ],
                [ -2.3033296695, 53.5869870368 ],
                [ -2.3035346548, 53.5868783318 ],
                [ -2.3035940672, 53.5868444834 ],
                [ -2.3037604011, 53.5867472825 ],
                [ -2.303916026, 53.5866503783 ],
                [ -2.3045966629, 53.5862124737 ],
                [ -2.3047187907, 53.5861361384 ],
                [ -2.3083452896, 53.5836657271 ],
                [ -2.3086850848, 53.5834319347 ],
                [ -2.3089159752, 53.5832590852 ],
                [ -2.3090026416, 53.5831898486 ],
                [ -2.3093248015, 53.5829125244 ],
                [ -2.3094975187, 53.5827563539 ],
                [ -2.3096176043, 53.5826408391 ],
                [ -2.3098913411, 53.5823505248 ],
                [ -2.3103024319, 53.5818884812 ],
                [ -2.3104644832, 53.5817062797 ],
                [ -2.3107754112, 53.5813439774 ],
                [ -2.3111147751, 53.580919949 ],
                [ -2.3114707764, 53.5804218391 ],
                [ -2.3117231828, 53.5800299352 ],
                [ -2.3118957433, 53.5797361944 ],
                [ -2.3120009338, 53.5795443417 ],
                [ -2.3121013736, 53.5793515126 ],
                [ -2.3122422022, 53.5790606316 ],
                [ -2.3123765917, 53.5787590802 ],
                [ -2.3124427576, 53.5785968918 ],
                [ -2.3125345996, 53.5783528692 ],
                [ -2.3126116435, 53.5781278416 ],
                [ -2.3127465576, 53.577679095 ],
                [ -2.3128143463, 53.5774159 ],
                [ -2.3128972436, 53.5770389986 ],
                [ -2.3129703505, 53.5766351668 ],
                [ -2.3130497464, 53.5760892614 ],
                [ -2.3131367212, 53.5755576191 ],
                [ -2.3131997963, 53.5752643367 ],
                [ -2.3132828155, 53.5749397316 ],
                [ -2.3133598197, 53.5746759838 ],
                [ -2.3134810067, 53.5743279175 ],
                [ -2.3135424784, 53.5741696069 ],
                [ -2.3136142941, 53.5739969778 ],
                [ -2.3137776738, 53.5736309223 ],
                [ -2.3139032721, 53.5733736884 ],
                [ -2.3140804542, 53.573036799 ],
                [ -2.3141995407, 53.5728264827 ],
                [ -2.3142717538, 53.5727081322 ],
                [ -2.3145033521, 53.5723383003 ],
                [ -2.3147831771, 53.5719275426 ],
                [ -2.3149170013, 53.5717566362 ],
                [ -2.3151540465, 53.5714689234 ],
                [ -2.3154174376, 53.5711586606 ],
                [ -2.3156472101, 53.5708990005 ],
                [ -2.3159570326, 53.5705710953 ],
                [ -2.3161384419, 53.5703897336 ],
                [ -2.3163682484, 53.5701681644 ],
                [ -2.3167348093, 53.5698385783 ],
                [ -2.3168754366, 53.5697131232 ],
                [ -2.3171387856, 53.5694832029 ],
                [ -2.3179595717, 53.568814631 ],
                [ -2.3183183646, 53.5685142631 ],
                [ -2.318557946, 53.5683068644 ],
                [ -2.3188868875, 53.5680277867 ],
                [ -2.3193444778, 53.5676074622 ],
                [ -2.3197208396, 53.5672314767 ],
                [ -2.3199553995, 53.5669888626 ],
                [ -2.320197472, 53.566719982 ],
                [ -2.320355622, 53.5665283478 ],
                [ -2.3205898687, 53.5662140246 ],
                [ -2.320717735, 53.5660194964 ],
                [ -2.3208848636, 53.5657171193 ],
                [ -2.3210076753, 53.5654660859 ],
                [ -2.3211337794, 53.5651560981 ],
                [ -2.3212113787, 53.5649182196 ],
                [ -2.3212568135, 53.5647370362 ],
                [ -2.321290458, 53.5645797846 ],
                [ -2.3213292883, 53.5643168434 ],
                [ -2.3213511899, 53.5640080354 ],
                [ -2.321345828, 53.5636976831 ],
                [ -2.3213338559, 53.5635318359 ],
                [ -2.3212796981, 53.5631561982 ],
                [ -2.3212383473, 53.5629884528 ],
                [ -2.3211987723, 53.5628436227 ],
                [ -2.3211482735, 53.5626857891 ],
                [ -2.3210896659, 53.5625257302 ],
                [ -2.3210307459, 53.5623899316 ],
                [ -2.3209749924, 53.5622614948 ],
                [ -2.3208606882, 53.5620296163 ],
                [ -2.3206709488, 53.561681389 ],
                [ -2.3205299228, 53.5614529885 ],
                [ -2.3203516623, 53.5611899211 ],
                [ -2.3200823148, 53.5608321992 ],
                [ -2.3198422415, 53.5605257124 ],
                [ -2.3196995195, 53.5603510476 ],
                [ -2.3193110323, 53.5599083708 ],
                [ -2.3191220424, 53.5597055338 ],
                [ -2.3189366431, 53.5595160705 ],
                [ -2.3186271706, 53.5592149797 ],
                [ -2.3183117388, 53.5589316919 ],
                [ -2.3181374784, 53.5587809192 ],
                [ -2.3179319578, 53.558614428 ],
                [ -2.3177209826, 53.5584498293 ],
                [ -2.3173532208, 53.5581759352 ],
                [ -2.3169217954, 53.5578747953 ],
                [ -2.3166784993, 53.5577152345 ],
                [ -2.3164809095, 53.5575909389 ],
                [ -2.3160740677, 53.5573486876 ],
                [ -2.315499848, 53.5570254714 ],
                [ -2.315140214, 53.5568343973 ],
                [ -2.3147737732, 53.5566490029 ],
                [ -2.3144793735, 53.5565083408 ],
                [ -2.3142291039, 53.5563945264 ],
                [ -2.3139424178, 53.5562714599 ],
                [ -2.3135839972, 53.5561254817 ],
                [ -2.313062012, 53.5559229739 ],
                [ -2.3126309459, 53.5557646993 ],
                [ -2.312283308, 53.5556443956 ],
                [ -2.3120123473, 53.555557767 ],
                [ -2.3118076366, 53.5554932462 ],
                [ -2.3115692672, 53.5554208136 ],
                [ -2.3112270174, 53.5553218761 ],
                [ -2.3109179981, 53.5552379513 ],
                [ -2.3104905258, 53.5551244128 ],
                [ -2.3093248837, 53.5548376573 ],
                [ -2.3090116806, 53.5547604708 ],
                [ -2.307493804, 53.5543971599 ],
                [ -2.3072697595, 53.5543433775 ],
                [ -2.3033510938, 53.5533915078 ],
                [ -2.300574656, 53.5527174399 ],
                [ -2.299842377, 53.552540744 ],
                [ -2.2990415347, 53.5523448013 ],
                [ -2.2981635611, 53.552134225 ],
                [ -2.2973611022, 53.5519353092 ],
                [ -2.2968259444, 53.5517885636 ],
                [ -2.2963452506, 53.5516358374 ],
                [ -2.2959067916, 53.5514874085 ],
                [ -2.2956151927, 53.5513777841 ],
                [ -2.2954425957, 53.5513078525 ],
                [ -2.2952051111, 53.5512115751 ],
                [ -2.2948700875, 53.551066481 ],
                [ -2.2945219772, 53.5508992171 ],
                [ -2.2940838818, 53.5506771035 ],
                [ -2.2938410461, 53.5505438138 ],
                [ -2.29363761, 53.5504222011 ],
                [ -2.2933974163, 53.5502755114 ],
                [ -2.2931622842, 53.5501227956 ],
                [ -2.2926920764, 53.5497876201 ],
                [ -2.2920469325, 53.5492743347 ],
                [ -2.2918669779, 53.5491081939 ],
                [ -2.2914803923, 53.5487147685 ],
                [ -2.2911462454, 53.5483107959 ],
                [ -2.2910296788, 53.5481682174 ],
                [ -2.2908916949, 53.5479900088 ],
                [ -2.2904886824, 53.5474850242 ],
                [ -2.2902021751, 53.5471286485 ],
                [ -2.2897937182, 53.5466087535 ],
                [ -2.289533985, 53.5462909496 ],
                [ -2.2893616323, 53.5460681695 ],
                [ -2.2891520648, 53.5458097161 ],
                [ -2.2890061971, 53.5456196681 ],
                [ -2.2888630113, 53.5454421067 ],
                [ -2.2884493736, 53.5449238352 ],
                [ -2.2878341946, 53.5441499703 ],
                [ -2.287672482, 53.5439539361 ],
                [ -2.2873513946, 53.5435566571 ],
                [ -2.2869681421, 53.5431283378 ],
                [ -2.2861234691, 53.5420651307 ],
                [ -2.2859928665, 53.5418488028 ],
                [ -2.2858065852, 53.5414941459 ],
                [ -2.2857246616, 53.5413196578 ],
                [ -2.2856979724, 53.5412375973 ],
                [ -2.2856542766, 53.5411039947 ],
                [ -2.2853814447, 53.5403106744 ],
                [ -2.2851905554, 53.539728949 ],
                [ -2.2851196907, 53.5392913348 ],
                [ -2.2851076717, 53.5391324958 ],
                [ -2.2851101265, 53.5388840365 ],
                [ -2.285158285, 53.53832914 ],
                [ -2.2851639393, 53.5382452032 ],
                [ -2.285169213, 53.5380301646 ],
                [ -2.2851610982, 53.5378211798 ],
                [ -2.2851401039, 53.537640161 ],
                [ -2.2851101544, 53.5374602509 ],
                [ -2.2850564682, 53.5372078797 ],
                [ -2.284992896, 53.5369842852 ],
                [ -2.2849374551, 53.5368234815 ],
                [ -2.284804518, 53.5364978003 ],
                [ -2.2847294166, 53.5363367731 ],
                [ -2.2846482298, 53.5361771983 ],
                [ -2.2844770288, 53.5358757762 ],
                [ -2.2844015547, 53.535751233 ],
                [ -2.2842427091, 53.5355123126 ],
                [ -2.2840857557, 53.53529442 ],
                [ -2.2839918998, 53.5351734251 ],
                [ -2.2837765562, 53.5349122649 ],
                [ -2.2836623611, 53.5347818887 ],
                [ -2.2834942109, 53.5346014844 ],
                [ -2.2833808613, 53.5344868263 ],
                [ -2.2832139709, 53.5343276309 ],
                [ -2.2830758372, 53.5342067388 ],
                [ -2.2829129331, 53.5340658606 ],
                [ -2.2825053961, 53.5337474695 ],
                [ -2.2821442421, 53.5334811633 ],
                [ -2.2819023349, 53.5333182757 ],
                [ -2.2818271054, 53.5332676853 ],
                [ -2.2815305698, 53.5330844398 ],
                [ -2.281215155, 53.5329046439 ],
                [ -2.2809424008, 53.532760072 ],
                [ -2.2805804572, 53.5325796721 ],
                [ -2.2802462999, 53.5324233762 ],
                [ -2.2800501857, 53.5323370304 ],
                [ -2.2797443138, 53.5322072638 ],
                [ -2.2794345169, 53.5320860443 ],
                [ -2.2791771444, 53.5319916589 ],
                [ -2.2787677116, 53.5318514324 ],
                [ -2.2785587997, 53.5317844291 ],
                [ -2.27808304, 53.5316405869 ],
                [ -2.2774705769, 53.5314752154 ],
                [ -2.2772896657, 53.5314306167 ],
                [ -2.2768050557, 53.5313187704 ],
                [ -2.2766368955, 53.5312836602 ],
                [ -2.2762499366, 53.5312098785 ],
                [ -2.2759270289, 53.5311557147 ],
                [ -2.2755248699, 53.5310966881 ],
                [ -2.2752248379, 53.5310591885 ],
                [ -2.274792647, 53.5310124518 ],
                [ -2.2744797584, 53.5309860262 ],
                [ -2.2742393335, 53.5309692328 ],
                [ -2.2738748629, 53.5309496548 ],
                [ -2.2730188729, 53.5309214871 ],
                [ -2.2701610677, 53.5308269369 ],
                [ -2.2698672993, 53.530813228 ],
                [ -2.2695307035, 53.5307926938 ],
                [ -2.2692911498, 53.5307757962 ],
                [ -2.2689889833, 53.5307508685 ],
                [ -2.268811255, 53.5307319522 ],
                [ -2.2683819283, 53.5306831301 ],
                [ -2.2681530035, 53.5306530922 ],
                [ -2.2675757876, 53.5305632702 ],
                [ -2.2672470445, 53.5305052393 ],
                [ -2.2667137581, 53.5304003041 ],
                [ -2.2657781963, 53.5301708281 ],
                [ -2.2643865667, 53.529810251 ],
                [ -2.2573940067, 53.5279909523 ],
                [ -2.2564782062, 53.5277028519 ],
                [ -2.2554422969, 53.5273140007 ],
                [ -2.2549897902, 53.527122578 ],
                [ -2.2546028107, 53.5269504292 ],
                [ -2.2542741743, 53.5267971116 ],
                [ -2.2529413641, 53.5261500834 ],
                [ -2.2523473398, 53.5258743869 ],
                [ -2.2520291095, 53.5257356924 ],
                [ -2.2518329803, 53.5256514616 ],
                [ -2.2512307889, 53.5254027421 ],
                [ -2.2508245236, 53.5252417584 ],
                [ -2.2503619357, 53.5250651615 ],
                [ -2.2500477005, 53.5249469381 ],
                [ -2.2498954101, 53.5248928945 ],
                [ -2.2496597422, 53.5248091922 ],
                [ -2.2488499935, 53.5245377041 ],
                [ -2.2486350654, 53.5244712055 ],
                [ -2.2481092112, 53.524295909 ],
                [ -2.2477265166, 53.5241637098 ],
                [ -2.2472819298, 53.5239968702 ],
                [ -2.2468537934, 53.5238155145 ],
                [ -2.2464293276, 53.5236214939 ],
                [ -2.2460248497, 53.5234220286 ],
                [ -2.2459470279, 53.523384626 ],
                [ -2.2456169504, 53.5232093649 ],
                [ -2.245341186, 53.5230515099 ],
                [ -2.2450789572, 53.5228891322 ],
                [ -2.2447749677, 53.5226855014 ],
                [ -2.2445745318, 53.5225427704 ],
                [ -2.2443547009, 53.5223766188 ],
                [ -2.2441608233, 53.5222250649 ],
                [ -2.2439208745, 53.5220222087 ],
                [ -2.2437611123, 53.5218775866 ],
                [ -2.2436018028, 53.5217249725 ],
                [ -2.2434799526, 53.5215998676 ],
                [ -2.2433905024, 53.5215065068 ],
                [ -2.2431957387, 53.521288726 ],
                [ -2.2430226942, 53.5210811476 ],
                [ -2.2428913908, 53.5209113975 ],
                [ -2.2428011373, 53.5207853288 ],
                [ -2.2426847876, 53.5206217501 ],
                [ -2.2426013145, 53.5204864183 ],
                [ -2.2424596501, 53.5202424619 ],
                [ -2.2423843517, 53.5201016303 ],
                [ -2.2422516456, 53.5198386987 ],
                [ -2.2418281972, 53.5189413285 ],
                [ -2.2413455335, 53.5179288709 ],
                [ -2.2412725559, 53.5177784162 ],
                [ -2.2410789551, 53.5173654535 ],
                [ -2.2410447161, 53.5172931833 ],
                [ -2.239712316, 53.5144768047 ],
                [ -2.2396434025, 53.5143389247 ],
                [ -2.2395335429, 53.5141071252 ],
                [ -2.2394449261, 53.5139381844 ],
                [ -2.2392775817, 53.5136553734 ],
                [ -2.2391875117, 53.5135144795 ],
                [ -2.2390236463, 53.5132729994 ],
                [ -2.2388222324, 53.5130098419 ],
                [ -2.2387384816, 53.5129086462 ],
                [ -2.2386291105, 53.5127833316 ],
                [ -2.2384961472, 53.512643152 ],
                [ -2.2383504633, 53.5124932812 ],
                [ -2.2382175737, 53.5123658649 ],
                [ -2.238042871, 53.5122065327 ],
                [ -2.2376838721, 53.5119081018 ],
                [ -2.2373663346, 53.5116667453 ],
                [ -2.2369967505, 53.5114070647 ],
                [ -2.236791482, 53.51127304 ],
                [ -2.2365718848, 53.5111354569 ],
                [ -2.2362395949, 53.5109422869 ],
                [ -2.2360670006, 53.5108476468 ],
                [ -2.2357186392, 53.5106676302 ],
                [ -2.2353706436, 53.5104877917 ],
                [ -2.2351946717, 53.5103897413 ],
                [ -2.234833086, 53.5101811648 ],
                [ -2.2346987326, 53.5100992112 ],
                [ -2.2344939818, 53.50996635 ],
                [ -2.2342503664, 53.5097965501 ],
                [ -2.2339970774, 53.509608522 ],
                [ -2.2337070831, 53.5093701488 ],
                [ -2.2334609333, 53.5091469696 ],
                [ -2.2332143982, 53.5088971937 ],
                [ -2.2330188897, 53.5086801168 ],
                [ -2.2328383971, 53.5084595946 ],
                [ -2.2327887985, 53.5083925653 ],
                [ -2.2326328652, 53.508182062 ],
                [ -2.2324588912, 53.5079232446 ],
                [ -2.2321257398, 53.5073833966 ],
                [ -2.2319728072, 53.5071523929 ],
                [ -2.2318001769, 53.5069116387 ],
                [ -2.2316171539, 53.5066779964 ],
                [ -2.2313968232, 53.5064180088 ],
                [ -2.2312040167, 53.5062142266 ],
                [ -2.2309278186, 53.5059466162 ],
                [ -2.2306739725, 53.5057185114 ],
                [ -2.2303852672, 53.5054785994 ],
                [ -2.2303190792, 53.5054231962 ],
                [ -2.2300758016, 53.5052409829 ],
                [ -2.2290731676, 53.504536884 ],
                [ -2.2289138394, 53.5044280161 ],
                [ -2.2286538664, 53.5042332496 ],
                [ -2.2284649617, 53.5040796844 ],
                [ -2.2282894551, 53.5039221383 ],
                [ -2.2281313817, 53.5037680643 ],
                [ -2.2279702245, 53.5035925226 ],
                [ -2.2278269677, 53.503420443 ],
                [ -2.2276101406, 53.5031328585 ],
                [ -2.2275596136, 53.5030526253 ],
                [ -2.2274164959, 53.5028353513 ],
                [ -2.2270444666, 53.5022789302 ],
                [ -2.2268023434, 53.5019298489 ],
                [ -2.2266494916, 53.5016807825 ],
                [ -2.2265084279, 53.5014510098 ],
                [ -2.2264174308, 53.5012835035 ],
                [ -2.2263218716, 53.5010800702 ],
                [ -2.2262615307, 53.5009279657 ],
                [ -2.2261852664, 53.500704092 ],
                [ -2.2261132646, 53.5004168598 ],
                [ -2.2260812562, 53.5002173416 ],
                [ -2.2260669454, 53.5000744979 ],
                [ -2.2260566621, 53.4998696353 ],
                [ -2.2260592927, 53.4996382504 ],
                [ -2.2261376608, 53.4981754697 ],
                [ -2.2261508363, 53.4980137879 ],
                [ -2.2261987438, 53.4970890578 ],
                [ -2.2262203669, 53.4966676663 ],
                [ -2.2262206615, 53.4964422091 ],
                [ -2.2262109138, 53.4962899187 ],
                [ -2.2261874366, 53.4960813149 ],
                [ -2.2261393058, 53.4958426467 ],
                [ -2.2260884077, 53.4956646465 ],
                [ -2.226043089, 53.4955324586 ],
                [ -2.2259593953, 53.4953351145 ],
                [ -2.2258659512, 53.4951266342 ],
                [ -2.2257704252, 53.4949261664 ],
                [ -2.2257123163, 53.4947949015 ],
                [ -2.2256572394, 53.4946497887 ],
                [ -2.2256120994, 53.4945025087 ],
                [ -2.2255611379, 53.4942662812 ],
                [ -2.2255434619, 53.4940052725 ],
                [ -2.2255537569, 53.4937890541 ],
                [ -2.2256014793, 53.4935533498 ],
                [ -2.2256834798, 53.4933155221 ],
                [ -2.2258306337, 53.4930372218 ],
                [ -2.2259586144, 53.4928471073 ],
                [ -2.2261973016, 53.4925807583 ],
                [ -2.226353256, 53.4924393885 ],
                [ -2.2265987831, 53.4922470725 ],
                [ -2.2267907862, 53.4921083211 ],
                [ -2.227113183, 53.4919285313 ],
                [ -2.2273883194, 53.4917897104 ],
                [ -2.22776315, 53.4916585271 ],
                [ -2.2280435491, 53.4915744162 ],
                [ -2.2282917235, 53.4915071748 ],
                [ -2.2285431752, 53.4914469375 ],
                [ -2.2288186148, 53.4913884514 ],
                [ -2.2290678971, 53.4913426886 ],
                [ -2.2299177846, 53.4912096765 ],
                [ -2.2313820357, 53.4909827331 ],
                [ -2.2318653746, 53.490903612 ],
                [ -2.2322349506, 53.490835416 ],
                [ -2.2326578274, 53.4907440055 ],
                [ -2.2337574873, 53.4905012146 ],
                [ -2.2342088526, 53.4903951905 ],
                [ -2.2345522071, 53.4903070845 ],
                [ -2.2351550204, 53.4901491829 ],
                [ -2.2358217644, 53.4899836015 ],
                [ -2.2371008279, 53.4896954106 ],
                [ -2.2377622387, 53.4895112229 ],
                [ -2.2391056661, 53.4891170253 ],
                [ -2.2395680077, 53.488976632 ],
                [ -2.2398518401, 53.4888939337 ],
                [ -2.2400940014, 53.4888007123 ],
                [ -2.2402202318, 53.4887547157 ],
                [ -2.2403108449, 53.4887159007 ],
                [ -2.2403813612, 53.488681162 ],
                [ -2.240474895, 53.4886311863 ],
                [ -2.2405431102, 53.4885866637 ],
                [ -2.2406090974, 53.488542586 ],
                [ -2.2408188535, 53.4883908419 ],
                [ -2.2417174125, 53.4877421261 ],
                //"Victoria",
                [ -2.2417174125, 53.4877421261 ],
                [ -2.2420411121, 53.4875246417 ],
                [ -2.2421196706, 53.4874418156 ],
                [ -2.2421297704, 53.4873813209 ],
                [ -2.2421114879, 53.4873146817 ],
                [ -2.2420679537, 53.4872623854 ],
                [ -2.2417038797, 53.486956258 ],
                [ -2.2416440503, 53.4869003902 ],
                [ -2.2414548524, 53.4867528701 ],
                [ -2.2413933334, 53.4866857806 ],
                [ -2.2413682265, 53.4866404588 ],
                [ -2.2412711421, 53.4863920226 ],
                [ -2.2412546913, 53.4863610465 ],
                [ -2.2412321499, 53.4863296422 ],
                [ -2.241194434, 53.4862957608 ],
                [ -2.2411607442, 53.4862703022 ],
                [ -2.2411258149, 53.4862468326 ],
                [ -2.2409430301, 53.4861798982 ],
                [ -2.2404212561, 53.4860395214 ],
                [ -2.240103557, 53.4859546203 ],
                [ -2.2399812306, 53.4859217089 ],
                [ -2.2398881387, 53.4858939427 ],
                [ -2.2398038501, 53.4858639207 ],
                [ -2.239721863, 53.485822398 ],
                [ -2.2396710874, 53.485786556 ],
                [ -2.2396197943, 53.4857471197 ],
                [ -2.2394713724, 53.4856236855 ],
                [ -2.2391654501, 53.4853321717 ],
                [ -2.2391066292, 53.4852776589 ],
                [ -2.2388534565, 53.485042925 ],
                [ -2.2387333751, 53.484923109 ],
                [ -2.2386926917, 53.4848673013 ],
                [ -2.2386687394, 53.4848283491 ],
                [ -2.238649868, 53.4847871486 ],
                [ -2.238625752, 53.4847189039 ],
                [ -2.2386036488, 53.4846306204 ],
                [ -2.2385931911, 53.4845606406 ],
                [ -2.2385906152, 53.4844341268 ],
                [ -2.2386162973, 53.4842273182 ],
                [ -2.2386365716, 53.4841421767 ],
                [ -2.2386627269, 53.484065841 ],
                [ -2.2387973566, 53.4837455893 ],
                [ -2.2389181184, 53.4834760503 ],
                [ -2.2389709511, 53.4833496954 ],
                [ -2.2390300321, 53.483139036 ],
                [ -2.2390703916, 53.4830457738 ],
                [ -2.2391843836, 53.482856846 ],
                [ -2.2392889289, 53.4826468237 ],
                [ -2.2394436211, 53.4823158357 ],
                [ -2.2394523667, 53.4822577719 ],
                [ -2.2394459665, 53.4822020755 ],
                [ -2.2394167479, 53.4821536153 ],
                [ -2.2393786544, 53.4821186463 ],
                [ -2.2393331246, 53.4820850404 ],
                [ -2.2392719662, 53.4820590159 ],
                [ -2.2390148741, 53.4819849453 ],
                [ -2.2388880798, 53.481951232 ],
                [ -2.238836318, 53.4819375024 ],
                [ -2.2384461281, 53.481833864 ],
                [ -2.2383155873, 53.4817955735 ],
                [ -2.2382164835, 53.4817580291 ],
                [ -2.2381653336, 53.4817215576 ],
                [ -2.2381343576, 53.481692686 ],
                [ -2.238106179, 53.4816520431 ],
                [ -2.2380930971, 53.4816218775 ],
                [ -2.2380946073, 53.4815819755 ],
                [ -2.2381021267, 53.4815496117 ],
                [ -2.2381255084, 53.4815083179 ],
                [ -2.2381572272, 53.481470513 ],
                [ -2.2382057084, 53.4814311557 ],
                [ -2.2383398701, 53.4813382463 ],
                [ -2.2384289716, 53.4812766968 ],
                [ -2.2384520067, 53.4812624494 ],
                    //"Delta junction north",
                        [ -2.2384520067, 53.4812624494 ],
                        [ -2.238463446, 53.4812440096 ],
                        [ -2.2384722799, 53.4812231392 ],
                        [ -2.2384779431, 53.4811903297 ],
                        [ -2.2384789291, 53.4811672368 ],
                        [ -2.2384738924, 53.481134179 ],
                        [ -2.2384642816, 53.4811022987 ],
                        [ -2.2384519937, 53.4810821086 ],
                        [ -2.2384380693, 53.4810602948 ],
                        [ -2.2384166959, 53.4810348196 ],
                        [ -2.2384008164, 53.4810190409 ],
                        [ -2.2383757357, 53.4809988672 ],
                    [ -2.2383545146, 53.4809817508 ],
                    //"Delta junction east",
                                [ -2.2383545146, 53.4809817508 ],
                                [ -2.2383155503, 53.4809659192 ],
                                [ -2.2382662269, 53.4809433759 ],
                                [ -2.2382160036, 53.4809161604 ],
                                [ -2.237796668, 53.4806882153 ],
                                [ -2.2375720234, 53.4805727482 ],
                                [ -2.2374552773, 53.480510619 ],
                                [ -2.236987811, 53.4802724384 ],
                                [ -2.236578328, 53.4800690876 ],
                                [ -2.2364886595, 53.4800310733 ],
                                [ -2.236415245, 53.4800085767 ],
                                [ -2.236328318, 53.4799921288 ],
                                [ -2.2362555689, 53.4799809471 ],
                                [ -2.236175506, 53.4799713976 ],
                                [ -2.236070935, 53.4799549843 ],
                                [ -2.2359884619, 53.4799346535 ],
                                [ -2.2359289765, 53.479915994 ],
                                [ -2.2358852616, 53.4798963148 ],
                                [ -2.2357655483, 53.4798172915 ],
                                [ -2.235573291, 53.4796685085 ],
                                [ -2.2350919469, 53.4793200866 ],
                                [ -2.2346444015, 53.4789706972 ],
                                [ -2.2340805323, 53.4785451588 ],
                                [ -2.2339618188, 53.4784630752 ],
                                [ -2.2338672425, 53.4784110554 ],
                                [ -2.2338001144, 53.4783801854 ],
                                [ -2.2337456017, 53.4783610656 ],
                                [ -2.2336619796, 53.4783365196 ],
                                [ -2.2335884731, 53.4783212028 ],
                                [ -2.2333820184, 53.4782792785 ],
                                [ -2.2328638675, 53.4781681468 ],
                                [ -2.232775952, 53.4781518687 ],
                                [ -2.2326751658, 53.4781211532 ],
                                [ -2.2325871566, 53.4780904129 ],
                                [ -2.2325177309, 53.478046882 ],
                                [ -2.2324544851, 53.4779761043 ],
                                [ -2.2322773226, 53.4777006816 ],
                                [ -2.2321634202, 53.4775427581 ],
                                [ -2.2321197205, 53.4774999789 ],
                                [ -2.2320782862, 53.4774665427 ],
                                [ -2.2319991638, 53.4774208749 ],
                                [ -2.2319301735, 53.4773904579 ],
                                [ -2.2318373127, 53.477356402 ],
                                [ -2.231725691, 53.4773218429 ],
                                [ -2.2315965814, 53.4772909127 ],
                                [ -2.2304092919, 53.4770298302 ],
                    [ -2.230190776, 53.4769818218 ]
    ]
}

struct MapView: UIViewRepresentable {
    
    let region: MKCoordinateRegion
    let lineCoordinatesFromOrigin: OrderedDictionary<String, CLLocationCoordinate2D>
    var lineCoordinatesFromInterchange: OrderedDictionary<String, CLLocationCoordinate2D>? = nil
    let lineColorFromOrigin: Color
    var lineColorFromInterchange: Color? = nil
    @Environment(\.colorScheme) private var displayMode
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        mapView.preferredConfiguration = MKStandardMapConfiguration(emphasisStyle: .muted)
        
        var testCoordinates: [CLLocationCoordinate2D] = []
        for coordinate in ExampleRouteCoordinates.exampleCoordinates {
            testCoordinates.append(CLLocationCoordinate2D(latitude: coordinate[1], longitude: coordinate[0]))
        }
        let testPolyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        testPolyline.routeColor = .yellow
        
        
        var stopAnnotations: [StopAnnotation] = []
        var routePolylines: [RoutePolyline] = []
        let polyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        polyline.routeColor = UIColor(lineColorFromOrigin)
        routePolylines.append(polyline)
        routePolylines.append(testPolyline)
        for (index, stop) in lineCoordinatesFromOrigin.keys.enumerated() {
            let annotation = StopAnnotation()
            if index == 0 {
                annotation.subtitle = "Start"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange != nil{
                annotation.subtitle = "Change here"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange == nil{
                annotation.subtitle = "Destination"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            annotation.stopColor = displayMode == .dark ? .white : .black
            annotation.coordinate = lineCoordinatesFromOrigin[stop]!
            annotation.title = stop
            stopAnnotations.append(annotation)
        }
        
        if (lineCoordinatesFromInterchange != nil && lineColorFromInterchange != nil) {
            let polylineFromInterchange = RoutePolyline(coordinates: lineCoordinatesFromInterchange!.map {$0.value}, count: lineCoordinatesFromInterchange!.count)
            polylineFromInterchange.routeColor = UIColor(lineColorFromInterchange!)
            routePolylines.append(polylineFromInterchange)
            
            for (index, stop) in lineCoordinatesFromInterchange!.keys.enumerated() {
                if index == 0 {
                    continue
                }
                
                let annotation = StopAnnotation()
                
                if index == lineCoordinatesFromInterchange!.keys.count - 1 {
                    annotation.subtitle = "Destination"
                    annotation.stopSize = CGSize(width: 30, height: 30)
                }
                 
                annotation.stopColor = displayMode == .dark ? .white : .black
                annotation.coordinate = lineCoordinatesFromInterchange![stop]!
                annotation.title = stop
                stopAnnotations.append(annotation)
            }
        }
        
        mapView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 100, right: 100)
        mapView.addOverlays(routePolylines)
        mapView.addAnnotations(stopAnnotations)
        mapView.region = region
        mapView.setRegion(region, animated: true)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.region = region
        
        view.overlays.forEach {
            view.removeOverlay($0)
        }
        
        view.annotations.forEach {
            view.removeAnnotation($0)
        }
        
        let testCoordinates = ExampleRouteCoordinates.exampleCoordinates.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0])}
        let testPolyline = RoutePolyline(coordinates: testCoordinates, count: testCoordinates.count)
        testPolyline.routeColor = .yellow
        var stopAnnotations: [StopAnnotation] = []
        var routePolylines: [RoutePolyline] = []
        let polyline = RoutePolyline(coordinates: lineCoordinatesFromOrigin.map {$0.value}, count: lineCoordinatesFromOrigin.count)
        polyline.routeColor = UIColor(lineColorFromOrigin)
        routePolylines.append(polyline)
        routePolylines.append(testPolyline)
        for (index, stop) in lineCoordinatesFromOrigin.keys.enumerated() {
            let annotation = StopAnnotation()
            if index == 0 {
                annotation.subtitle = "Start"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange != nil{
                annotation.subtitle = "Change here"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            
            if index == lineCoordinatesFromOrigin.keys.count - 1 && lineColorFromInterchange == nil{
                annotation.subtitle = "Destination"
                annotation.stopSize = CGSize(width: 30, height: 30)
            }
            annotation.stopColor = displayMode == .dark ? .white : .black
            annotation.coordinate = lineCoordinatesFromOrigin[stop]!
            annotation.title = stop
            stopAnnotations.append(annotation)
        }
        
        if (lineCoordinatesFromInterchange != nil && lineColorFromInterchange != nil) {
            let polylineFromInterchange = RoutePolyline(coordinates: lineCoordinatesFromInterchange!.map {$0.value}, count: lineCoordinatesFromInterchange!.count)
            polylineFromInterchange.routeColor = UIColor(lineColorFromInterchange!)
            routePolylines.append(polylineFromInterchange)
            
            
            for (index, stop) in lineCoordinatesFromInterchange!.keys.enumerated() {
                if index == 0 {
                    continue
                }
                
                let annotation = StopAnnotation()
                if index == lineCoordinatesFromInterchange!.keys.count - 1 {
                    annotation.subtitle = "Destination"
                    annotation.stopSize = CGSize(width: 30, height: 30)
                }
                    
                annotation.stopColor = displayMode == .dark ? .white : .black
                annotation.coordinate = lineCoordinatesFromInterchange![stop]!
                annotation.title = stop
                stopAnnotations.append(annotation)
                
            }
        }
        
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 100, right: 100)
        view.addOverlays(routePolylines)
        view.addAnnotations(stopAnnotations)
        view.region = region
        view.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let routePolyline = overlay as? RoutePolyline
            let renderer = MKPolylineRenderer(polyline: routePolyline!)
            renderer.strokeColor = routePolyline!.routeColor
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is StopAnnotation {
            let annotation = annotation as? StopAnnotation
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: UUID().uuidString)
            annotationView.canShowCallout = true
            annotationView.image = UIImage(systemName: "smallcircle.filled.circle")?.withTintColor(annotation!.stopColor)
            annotationView.image = UIGraphicsImageRenderer(size: annotation!.stopSize).image {
                 _ in annotationView.image!.draw(in:CGRect(origin: .zero, size: annotation!.stopSize))
            }
            return annotationView
        }
        

        return nil
    }
}

class RoutePolyline: MKPolyline {
    var routeColor: UIColor = UIColor.clear
}

class StopAnnotation: MKPointAnnotation {
    var stopColor: UIColor = .white
    var stopSize: CGSize = CGSize(width: 15, height: 15)
}
