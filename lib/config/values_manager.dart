class ValuesManager {
  // a class that store possible values in dropdowns button
  static final List<String> genders = [
    "Men",
    "Women",
  ];

  static final List<String> tradeValues = [
    "Wholesale",
    "Suedo wholesale",
  ];

  static final List<String> typeValues = [
    "Alimentation",
    "Perfume",
  ];
  static final Map<String, List<String>> stateValues = {
    "Adrar": ["Adrar", "Charouine", "Reggane", "Timimoun", "Tsabit"],
    "Chlef": [
      "Chlef",
      "Abou el Hassen",
      "Oued Fodda",
      "El Karimia",
      "Beni Haoua"
    ],
    "Laghouat": ["Laghouat", "Aflou", "Brida", "El Ghicha", "Ksar El Hirane"],
    "Oum El Bouaghi": [
      "Oum El Bouaghi",
      "Aïn Beïda",
      "Aïn M'lila",
      "Aïn Fakroun",
      "Sigus"
    ],
    "Batna": ["Batna", "Aïn Touta", "Barika", "Merouana", "Timgad"],
    "Béjaïa": ["Béjaïa", "Akbou", "Amizour", "Barbacha", "Seddouk"],
    "Biskra": ["Biskra", "Aïn Naga", "Branis", "Chetma", "Ourlal"],
    "Béchar": ["Béchar", "Abadla", "Beni Abbès", "Igli", "Kenedza"],
    "Blida": ["Blida", "Bouarfa", "Boufarik", "El Affroun", "Meftah"],
    "Bouira": [
      "Bouira",
      "Aïn Bessem",
      "Aïn El Hadjar",
      "Bechloul",
      "El Hakimia"
    ],
    "Tamanrasset": [
      "Tamanrasset",
      "In Amguel",
      "In Ghar",
      "In Guezzam",
      "Idlès"
    ],
    "Tébessa": ["Tébessa", "Bir El Ater", "El Ogla", "Morsott", "Negrine"],
    "Tlemcen": [
      "Tlemcen",
      "Aïn Fezza",
      "Aïn Ghoraba",
      "Beni Bahdel",
      "Bab El Assa"
    ],
    "Tiaret": [
      "Tiaret",
      "Aïn Kermes",
      "Aïn Zarit",
      "Aïn Deheb",
      "Aïn Bouchekif"
    ],
    "Tizi Ouzou": [
      "Tizi Ouzou",
      "Aïn El Hammam",
      "Aït Yahia",
      "Akbil",
      "Azazga"
    ],
    "Alger": ["Alger", "Bab El Oued", "Baraki", "Birkhadem", "Bordj El Kiffan"],
    "Djelfa": [
      "Djelfa",
      "Aïn Maabed",
      "Aïn El Ibel",
      "Aïn Feka",
      "Beni Yacoub"
    ],
    "Jijel": ["Jijel", "Achouat", "Chekfa", "El Ancer", "El Aouana"],
    "Sétif": ["Sétif", "Aïn Arnat", "Aïn Azel", "Aïn El Kebira", "Aïn Oulmene"],
    "Saïda": [
      "Saïda",
      "Aïn El Hadjar",
      "El Hassasna",
      "Hounet",
      "Ouled Khaled"
    ],
    "Skikda": [
      "Skikda",
      "Aïn Charchar",
      "Azzaba",
      "Bekkouche Lakhdar",
      "Beni Zid"
    ],
    "Sidi Bel Abbès": [
      "Sidi Bel Abbès",
      "Aïn El Berd",
      "Aïn Tindamine",
      "Amarnas",
      "Badredine El Mokrani"
    ],
    "Annaba": ["Annaba", "Aïn Berda", "Berrahal", "Chetaïbi", "El Bouni"],
    "Guelma": [
      "Guelma",
      "Aïn Ben Beida",
      "Aïn Larbi",
      "Bou Hamdane",
      "Hammam Debagh"
    ],
    "Constantine": [
      "Constantine",
      "Aïn Abid",
      "Aïn Smara",
      "Beni Hamiden",
      "Didouche Mourad"
    ],
    "Médéa": ["Médéa", "Aïn Boucif", "Aïn Ouksir", "Aïn Tiza", "Bouaïcha"],
    "Mostaganem": [
      "Mostaganem",
      "Achaacha",
      "Aïn Nouissy",
      "Aïn Tédelès",
      "Bouguirat"
    ],
    "M\"Sila": [
      "M\"Sila",
      "Aïn El Hadjel",
      "Aïn Khadra",
      "Aïn M\"lila",
      "Aïn Reggada"
    ],
    "Mascara": ["Mascara", "Aïn Fekan", "Aïn Ferah", "Aïn Frass", "Aïn Senour"],
    "Ouargla": [
      "Ouargla",
      "Aïn Beïda",
      "Aïn Djasser",
      "Aïn El Beïda",
      "Bérianne"
    ],
    "Oran": ["Oran", "Aïn El Turk", "Arzew", "Bethioua", "Bir El Djir"],
    "El Bayadh": [
      "El Bayadh",
      "Aïn El Orak",
      "Arbaouet",
      "Brezina",
      "Boussemghoun"
    ],
    "Illizi": ["Illizi", "Djanet", "Bordj Omar Driss", "Debdeb", "In Amenas"],
    "Bordj Bou Arréridj": [
      "Bordj Bou Arréridj",
      "Aïn Taghrout",
      "Belimour",
      "Bir Kasdali",
      "Bir Mokadem"
    ],
    "Boumerdès": [
      "Boumerdès",
      "Afir",
      "Baghlia",
      "Boudouaou",
      "Boudouaou El Bahri"
    ],
    "El Tarf": ["El Tarf", "Aïn El Assel", "Berrihane", "Bouhadjar", "Bougous"],
    "Tindouf": [
      "Tindouf",
      "Oum El Assel",
      "Routaba",
      "Tinfouchy",
      "Tisserdmine"
    ],
    "Tissemsilt": [
      "Tissemsilt",
      "Ammari",
      "Beni Chaïb",
      "Bordj Bounaama",
      "Bordj Emir Khaled"
    ],
    "El Oued": ["El Oued", "Bayadha", "Djamaa", "El Ogla", "Guemar"],
    "Khenchela": ["Khenchela", "Aïn Touila", "Baghai", "Bouhmama", "El Mahmal"],
    "Souk Ahras": [
      "Souk Ahras",
      "Aïn Berda",
      "Aïn Zana",
      "Haddada",
      "M\"daourouch"
    ],
    "Tipaza": ["Tipaza", "Aghbal", "Aïn Tagourait", "Attatba", "Bou Ismaïl"],
    "Mila": ["Mila", "Aïn Beïda", "Aïn Mellouk", "Aïn Tine", "Amira Arras"],
    "Aïn Defla": [
      "Aïn Defla",
      "Aïn Lechiakh",
      "Aïn Soltane",
      "Bathia",
      "Belaas"
    ],
    "Naâma": ["Naâma", "Aïn Ben Khelil", "Asla", "Mechraa Safa", "Moghrar"],
    "Aïn Témouchent": [
      "Aïn Témouchent",
      "Aghlal",
      "Aïn El Arbaa",
      "Bou Zedjar",
      "Chaabet El Ham"
    ],
    "Ghardaïa": [
      "Ghardaïa",
      "Aïn El Hadjel",
      "Aïn Naga",
      "Aïn Sebaa",
      "Bab El Assa"
    ],
    "Relizane": [
      "Relizane",
      "Ammi Moussa",
      "Bendaoud",
      "El Guettar",
      "El Hamadna"
    ],
  };
}
