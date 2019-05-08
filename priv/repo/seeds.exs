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
alias Eazip.Commands.Command

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

quentin =
  Repo.insert!(%User{
    first_name: "Quentin",
    last_name: "Michalet",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75000",
    street: "01 Bd du temple",
    type: 1
  })

julien =
  Repo.insert!(%User{
    first_name: "Julien",
    last_name: "Furberg",
    birthdate: ~D[1995-01-12],
    sex: 1,
    country: "FR",
    city: "Paris",
    post_code: "75000",
    street: "02 rue de Rivoli",
    type: 1
  })

marie =
  Repo.insert!(%User{
    first_name: "Marie",
    last_name: "Charles",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75000",
    street: "03 rue Mouffetard",
    type: 2
  })

alison =
  Repo.insert!(%User{
    first_name: "Alison",
    last_name: "Sayarath",
    birthdate: ~D[1995-01-12],
    sex: 2,
    country: "FR",
    city: "Paris",
    post_code: "75000",
    street: "04 rue Royale",
    type: 2
  })

# Credentials

Repo.insert!(%Credential{
  user_id: admin.id,
  email: "admin@eazip.com",
  password: "admin"
})

Repo.insert!(%Credential{
  user_id: julien.id,
  email: "julien.furberg@hetic.net",
  password: "julien"
})

Repo.insert!(%Credential{
  user_id: quentin.id,
  email: "quentin.michalet@hetic.net",
  password: "quentin"
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
    type: "dress",
    image: ""
  })

clothe_trouser =
  Repo.insert!(%Clothe{
    type: "trouser",
    image: ""
  })

clothe_t_shirt =
  Repo.insert!(%Clothe{
    type: "t-shirt",
    image: ""
  })

clothe_skirt =
  Repo.insert!(%Clothe{
    type: "skirt",
    image: ""
  })

clothe_shirt =
  Repo.insert!(%Clothe{
    type: "shirt",
    image: ""
  })

clothe_pullover =
  Repo.insert!(%Clothe{
    type: "pullover",
    image: ""
  })

clothe_blazer =
  Repo.insert!(%Clothe{
    type: "blazer",
    image: ""
  })

clothe_coat =
  Repo.insert!(%Clothe{
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
    image: "",
    type: "hem",
    description: "hem description",
    category_id: alteration_category_commons.id
  })

alteation_commons_zip =
  Repo.insert!(%Alteration{
    image: "",
    type: "zip",
    description: "zip description",
    category_id: alteration_category_commons.id
  })

alteration_commons_tear =
  Repo.insert!(%Alteration{
    image: "",
    type: "tear",
    description: "tear description",
    category_id: alteration_category_commons.id
  })

alteration_commons_seam =
  Repo.insert!(%Alteration{
    image: "",
    type: "seam",
    description: "seam description",
    category_id: alteration_category_commons.id
  })

alteration_shorten_sleeve =
  Repo.insert!(%Alteration{
    image: "",
    type: "sleeve",
    description: "sleeve description",
    category_id: alteration_category_shorten.id
  })

alteration_shorten_waist =
  Repo.insert!(%Alteration{
    image: "",
    type: "waist",
    description: "waist description",
    category_id: alteration_category_shorten.id
  })

alteration_shorten_bottom =
  Repo.insert!(%Alteration{
    image: "",
    type: "bottom",
    description: "bottom description",
    category_id: alteration_category_shorten.id
  })

alteration_extend_sleeve =
  Repo.insert!(%Alteration{
    image: "",
    type: "sleeve",
    description: "sleeve description",
    category_id: alteration_category_extend.id
  })

alteration_extend_waist =
  Repo.insert!(%Alteration{
    image: "",
    type: "waist",
    description: "waist description",
    category_id: alteration_category_extend.id
  })

alteration_extend_bottom =
  Repo.insert!(%Alteration{
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

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_commons_tear.id,
  value_base: 10.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_commons_seam.id,
  value_base: 15.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_shorten_sleeve.id,
  value_base: 15.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_shorten_waist.id,
  value_base: 25.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_shorten_bottom.id,
  value_base: 20.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_extend_bottom.id,
  value_base: 30.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_extend_sleeve.id,
  value_base: 25.00
})

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_extend_waist.id,
  value_base: 35.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_commons_seam.id,
  value_base: 10.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_commons_hem.id,
  value_base: 10.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_commons_tear.id,
  value_base: 15.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_extend_bottom.id,
  value_base: 15.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_extend_waist.id,
  value_base: 25.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_shorten_bottom.id,
  value_base: 10.00
})

Repo.insert!(%Service{
  clothe_id: clothe_trouser.id,
  alteration_id: alteration_shorten_waist.id,
  value_base: 30.00
})

# Commands

Repo.insert!(%Command{
  status: "pending",
  customer_id: quentin.id,
  sewer_id: marie.id
})
