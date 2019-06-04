# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Eazip.Repo.insert!(%Eazip.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Eazip.Repo
alias Eazip.Clothes.Clothe
alias Eazip.Alterations.{Alteration, AlterationCategory}
alias Eazip.Services.Service
alias Eazip.Accounts.{User, Credential}
alias Eazip.Commands.{Command, CommandService}
alias Eazip.Sewers.SewerProfile
alias Eazip.Reviews.Review

# Users

admin =
  Repo.insert!(%User{
    first_name: "Sebastien",
    last_name: "Baudray",
    birthdate: ~D[2000-01-01],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75000",
    street: "",
    type: 0
  })

# Customers

leila =
  Repo.insert!(%User{
    first_name: "Leila",
    last_name: "Haron",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

manon =
  Repo.insert!(%User{
    first_name: "Manon",
    last_name: "Louet",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

jean_paul =
  Repo.insert!(%User{
    first_name: "Jean Paul",
    last_name: "Bizouarn",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

hanna =
  Repo.insert!(%User{
    first_name: "Hanna",
    last_name: "Shaposhnik",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

giovanni =
  Repo.insert!(%User{
    first_name: "Giovanni",
    last_name: "Naoned",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

corentin =
  Repo.insert!(%User{
    first_name: "Corentin",
    last_name: "Dams",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

sandra =
  Repo.insert!(%User{
    first_name: "Sandra",
    last_name: "Gouveia",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "02 rue de Rivoli",
    type: 1
  })

# Sewers

marie =
  Repo.insert!(%User{
    first_name: "Marie",
    last_name: "Sayarath",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "03 rue Mouffetard",
    type: 2
  })

alison =
  Repo.insert!(%User{
    first_name: "Alison",
    last_name: "Charles",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "04 rue Royale",
    type: 2
  })

lea =
  Repo.insert!(%User{
    first_name: "Lea",
    last_name: "Pierre",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

valerie =
  Repo.insert!(%User{
    first_name: "Valérie",
    last_name: "Gourdon",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

cynthia =
  Repo.insert!(%User{
    first_name: "Cynthia",
    last_name: "Cabral",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

camille =
  Repo.insert!(%User{
    first_name: "Camille",
    last_name: "Guillaume",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

melanie =
  Repo.insert!(%User{
    first_name: "Mélanie",
    last_name: "Lange",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

annie =
  Repo.insert!(%User{
    first_name: "Annie",
    last_name: "Brouard",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

eva =
  Repo.insert!(%User{
    first_name: "Eva",
    last_name: "Rondeau",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

pauline =
  Repo.insert!(%User{
    first_name: "Pauline",
    last_name: "Guyot-Walser",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

anna =
  Repo.insert!(%User{
    first_name: "Anna",
    last_name: "Grandcolas",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

leatitia =
  Repo.insert!(%User{
    first_name: "Leatitia",
    last_name: "Etchevery",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75012",
    street: "",
    type: 2
  })

# SewerProfiles

Repo.insert!(%SewerProfile{
  user_id: alison.id,
  description:
    "Passionnée par la couture depuis l'age de 6 mois, j'ai collaboré avec les plus grandes marques de moyenne et haute couture.",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583458/Couturier_03_djapfh.png"
})

Repo.insert!(%SewerProfile{
  user_id: marie.id,
  description:
    "Championne du monde de couture croisée, je me prépare pour les jeux olympiques de Paris 2024",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583458/Couturier_01_n0rdzh.png"
})

Repo.insert!(%SewerProfile{
  user_id: lea.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583458/Couturier_02_ebwbwj.png"
})

Repo.insert!(%SewerProfile{
  user_id: anna.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583462/Couturier_11_jdafmk.png"
})

Repo.insert!(%SewerProfile{
  user_id: pauline.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583461/Couturier_10_gzkxqx.png"
})

Repo.insert!(%SewerProfile{
  user_id: valerie.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583458/Couturier_04_w9ewx5.png"
})

Repo.insert!(%SewerProfile{
  user_id: cynthia.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583461/Couturier_05_pzc0ky.png"
})

Repo.insert!(%SewerProfile{
  user_id: camille.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583459/Couturier_06_wcv4fo.png"
})

Repo.insert!(%SewerProfile{
  user_id: melanie.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583461/Couturier_07_bvinyj.png"
})

Repo.insert!(%SewerProfile{
  user_id: annie.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583460/Couturier_08_u83iif.png"
})

Repo.insert!(%SewerProfile{
  user_id: eva.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583462/Couturier_09_qxq4ts.png"
})

Repo.insert!(%SewerProfile{
  user_id: leatitia.id,
  description: "",
  picture:
    "https://res.cloudinary.com/ferrandine/image/upload/v1559583461/Couturier_13_wm5c03.png"
})

# Credentials

Repo.insert!(%Credential{
  user_id: admin.id,
  email: "admin@eazip.com",
  password: "admin"
})

Repo.insert!(%Credential{
  user_id: alison.id,
  email: "alison.sayarath@hetic.net",
  password: "alison"
})

Repo.insert!(%Credential{
  user_id: marie.id,
  email: "marie.charles@hetic.net",
  password: "marie"
})

# Clothes

clothe_dress =
  Repo.insert!(%Clothe{
    label: "Robe",
    type: "dress",
    image: ""
  })

clothe_trouser =
  Repo.insert!(%Clothe{
    label: "Pantalon",
    type: "trouser",
    image: ""
  })

clothe_t_shirt =
  Repo.insert!(%Clothe{
    label: "T-Shirt",
    type: "t-shirt",
    image: ""
  })

clothe_skirt =
  Repo.insert!(%Clothe{
    label: "Jupe",
    type: "skirt",
    image: ""
  })

clothe_shirt =
  Repo.insert!(%Clothe{
    label: "Short",
    type: "shirt",
    image: ""
  })

clothe_pullover =
  Repo.insert!(%Clothe{
    label: "Pull-over",
    type: "pullover",
    image: ""
  })

clothe_blazer =
  Repo.insert!(%Clothe{
    label: "Blazer",
    type: "blazer",
    image: ""
  })

clothe_coat =
  Repo.insert!(%Clothe{
    label: "Manteau",
    type: "coat",
    image: ""
  })

# Alteration Categories

alteration_category_commons =
  Repo.insert!(%AlterationCategory{
    type: "commons"
  })

alteration_category_shorten =
  Repo.insert!(%AlterationCategory{
    type: "shorten"
  })

alteration_category_arch =
  Repo.insert!(%AlterationCategory{
    type: "arch"
  })

alteration_category_extend =
  Repo.insert!(%AlterationCategory{
    type: "extend"
  })

alteration_category_embroidery =
  Repo.insert!(%AlterationCategory{
    type: "embroidery"
  })

# Alterations

alteration_commons_hem =
  Repo.insert!(%Alteration{
    label: "Ourlet simple",
    image: "",
    type: "hem",
    description: "hem description",
    category_id: alteration_category_commons.id
  })

alteation_commons_zip =
  Repo.insert!(%Alteration{
    label: "Zip: ajout/remplacement",
    image: "",
    type: "zip",
    description: "zip description",
    category_id: alteration_category_commons.id
  })

alteration_commons_tear =
  Repo.insert!(%Alteration{
    label: "Déchirure/Réparation",
    image: "",
    type: "tear",
    description: "tear description",
    category_id: alteration_category_commons.id
  })

alteration_commons_seam =
  Repo.insert!(%Alteration{
    label: "Couture d'appoint",
    image: "",
    type: "seam",
    description: "seam description",
    category_id: alteration_category_commons.id
  })

alteration_shorten_sleeve =
  Repo.insert!(%Alteration{
    label: "Rétrécir - Manches",
    image: "",
    type: "sleeve",
    description: "sleeve description",
    category_id: alteration_category_shorten.id
  })

alteration_shorten_waist =
  Repo.insert!(%Alteration{
    label: "Rétrécir - Taille",
    image: "",
    type: "waist",
    description: "waist description",
    category_id: alteration_category_shorten.id
  })

alteration_shorten_bottom =
  Repo.insert!(%Alteration{
    label: "Rétrécir - Bas",
    image: "",
    type: "bottom",
    description: "bottom description",
    category_id: alteration_category_shorten.id
  })

alteration_extend_sleeve =
  Repo.insert!(%Alteration{
    label: "Etendre - Manches",
    image: "",
    type: "sleeve",
    description: "sleeve description",
    category_id: alteration_category_extend.id
  })

alteration_extend_waist =
  Repo.insert!(%Alteration{
    label: "Etendre - Taille",
    image: "",
    type: "waist",
    description: "waist description",
    category_id: alteration_category_extend.id
  })

alteration_extend_bottom =
  Repo.insert!(%Alteration{
    label: "Etendre - Bas",
    image: "",
    type: "bottom",
    description: "bottom description",
    category_id: alteration_category_extend.id
  })

# Services

service_dress_commons_hem =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_commons_hem.id,
    value_base: 10.00
  })

service_dress_commons_tear =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_commons_tear.id,
    value_base: 10.00
  })

service_dress_commons_seam =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_commons_seam.id,
    value_base: 15.00
  })

service_dress_shorten_sleeve =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_shorten_sleeve.id,
    value_base: 15.00
  })

service_dress_shorten_waist =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_shorten_waist.id,
    value_base: 25.00
  })

service_dress_shorten_bottom =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_shorten_bottom.id,
    value_base: 20.00
  })

service_dress_extend_bottom =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_extend_bottom.id,
    value_base: 30.00
  })

service_dress_extend_sleeve =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_extend_sleeve.id,
    value_base: 25.00
  })

service_dress_extend_waist =
  Repo.insert!(%Service{
    clothe_id: clothe_dress.id,
    alteration_id: alteration_extend_waist.id,
    value_base: 35.00
  })

service_trouser_commons_seam =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_commons_seam.id,
    value_base: 10.00
  })

service_trouser_commons_hem =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_commons_hem.id,
    value_base: 10.00
  })

service_trouser_commons_tear =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_commons_tear.id,
    value_base: 15.00
  })

service_trouser_extend_bottom =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_extend_bottom.id,
    value_base: 15.00
  })

service_trouser_extend_waist =
  service_trouser_extend_waist =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_extend_waist.id,
    value_base: 25.00
  })

service_trouser_shorten_bottom =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_shorten_bottom.id,
    value_base: 10.00
  })

service_trouser_shorten_waist =
  Repo.insert!(%Service{
    clothe_id: clothe_trouser.id,
    alteration_id: alteration_shorten_waist.id,
    value_base: 30.00
  })

# Commands

{:ok, date_0, _} = DateTime.from_iso8601("2019-06-02T17:00:00+0100")
{:ok, date_1, _} = DateTime.from_iso8601("2019-06-08T11:00:00+0100")
{:ok, date_2, _} = DateTime.from_iso8601("2019-06-11T16:00:00+0100")
{:ok, date_3, _} = DateTime.from_iso8601("2019-06-12T16:00:00+0100")
{:ok, date_4, _} = DateTime.from_iso8601("2019-06-10T16:00:00+0100")
{:ok, date_5, _} = DateTime.from_iso8601("2019-06-13T16:00:00+0100")
{:ok, date_6, _} = DateTime.from_iso8601("2019-06-09T16:00:00+0100")
{:ok, date_7, _} = DateTime.from_iso8601("2019-06-14T16:00:00+0100")
{:ok, date_8, _} = DateTime.from_iso8601("2019-06-15T16:00:00+0100")
{:ok, date_9, _} = DateTime.from_iso8601("2019-06-16T12:00:00+0100")
{:ok, date_10, _} = DateTime.from_iso8601("2019-06-17T14:00:00+0100")

command_1 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_1,
    customer_id: hanna.id,
    sewer_id: marie.id
  })

command_2 =
  Repo.insert!(%Command{
    status: "delivered",
    appointment_at: date_0,
    customer_id: leila.id,
    sewer_id: alison.id
  })

command_3 =
  Repo.insert!(%Command{
    status: "approved",
    appointment_at: date_3,
    customer_id: manon.id,
    sewer_id: alison.id
  })

command_4 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_6,
    customer_id: jean_paul.id,
    sewer_id: alison.id
  })

command_5 =
  Repo.insert!(%Command{
    status: "approved",
    appointment_at: date_7,
    customer_id: giovanni.id,
    sewer_id: alison.id
  })

command_6 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_8,
    customer_id: corentin.id,
    sewer_id: lea.id
  })

command_7 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_9,
    customer_id: corentin.id,
    sewer_id: anna.id
  })

command_8 =
  Repo.insert!(%Command{
    status: "approved",
    appointment_at: date_10,
    customer_id: sandra.id,
    sewer_id: anna.id
  })

command_9 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_0,
    customer_id: jean_paul.id,
    sewer_id: anna.id
  })

command_10 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_3,
    customer_id: leila.id,
    sewer_id: valerie.id
  })

command_11 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_7,
    customer_id: hanna.id,
    sewer_id: melanie.id
  })

command_12 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_4,
    customer_id: manon.id,
    sewer_id: melanie.id
  })

command_13 =
  Repo.insert!(%Command{
    status: "approved",
    appointment_at: date_6,
    customer_id: sandra.id,
    sewer_id: camille.id
  })

command_14 =
  Repo.insert!(%Command{
    status: "delivered",
    appointment_at: date_0,
    customer_id: sandra.id,
    sewer_id: annie.id
  })

command_15 =
  Repo.insert!(%Command{
    status: "placed",
    appointment_at: date_3,
    customer_id: corentin.id,
    sewer_id: annie.id
  })

Repo.insert!(%CommandService{
  service_id: service_dress_commons_hem.id,
  command_id: command_1.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_commons_hem.id,
  command_id: command_1.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_extend_waist.id,
  command_id: command_2.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_shorten_waist.id,
  command_id: command_3.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_commons_seam.id,
  command_id: command_4.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_extend_waist.id,
  command_id: command_5.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_shorten_sleeve.id,
  command_id: command_5.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_commons_tear.id,
  command_id: command_6.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_commons_seam.id,
  command_id: command_7.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_commons_tear.id,
  command_id: command_7.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_extend_bottom.id,
  command_id: command_8.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_shorten_bottom.id,
  command_id: command_9.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_extend_waist.id,
  command_id: command_10.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_extend_sleeve.id,
  command_id: command_11.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_commons_hem.id,
  command_id: command_12.id
})

Repo.insert!(%CommandService{
  service_id: service_dress_commons_seam.id,
  command_id: command_13.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_commons_hem.id,
  command_id: command_14.id
})

Repo.insert!(%CommandService{
  service_id: service_trouser_shorten_waist.id,
  command_id: command_15.id
})

# Reviews

Repo.insert!(%Review{
  customer_id: command_2.customer_id,
  sewer_id: command_2.sewer_id,
  command_id: command_2.id,
  comment: "Alison était super, arrivée à l'heure, super sympa m'a donné plein de bons conseils",
  rating: 5
})
