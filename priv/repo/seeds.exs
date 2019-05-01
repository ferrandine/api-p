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

# Clothes

clothe_dress = Repo.insert!(%Clothe{
  type: "dress",
  image: ""
})
Repo.insert!(%Clothe{
  type: "trouser",
  image: ""
})
Repo.insert!(%Clothe{
  type: "t-shirt",
  image: ""
})
Repo.insert!(%Clothe{
  type: "skirt",
  image: ""
})
Repo.insert!(%Clothe{
  type: "shirt",
  image: ""
})
Repo.insert!(%Clothe{
  type: "pullover",
  image: ""
})
Repo.insert!(%Clothe{
  type: "blazer",
  image: ""
})
Repo.insert!(%Clothe{
  type: "coat",
  image: ""
})

# Alteration Categories

alteration_category_commons = Repo.insert!(%AlterationCategory{
  type: "commons"
})
alteration_category_shorten = Repo.insert!(%AlterationCategory{
  type: "shorten"
})
Repo.insert!(%AlterationCategory{
  type: "arch"
})
alteration_category_extend = Repo.insert!(%AlterationCategory{
  type: "extend"
})
Repo.insert!(%AlterationCategory{
  type: "embroidery"
})

# Alterations

alteration_commons_hem = Repo.insert!(%Alteration{
  image: "",
  type: "hem",
  description: "hem description",
  category_id: alteration_category_commons.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "zip",
  description: "zip description",
  category_id: alteration_category_commons.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "tear",
  description: "tear description",
  category_id: alteration_category_commons.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "seam",
  description: "seam description",
  category_id: alteration_category_commons.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "sleeve",
  description: "sleeve description",
  category_id: alteration_category_shorten.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "waist",
  description: "waist description",
  category_id: alteration_category_shorten.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "bottom",
  description: "bottom description",
  category_id: alteration_category_shorten.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "sleeve",
  description: "sleeve description",
  category_id: alteration_category_extend.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "waist",
  description: "waist description",
  category_id: alteration_category_extend.id 
})
Repo.insert!(%Alteration{
  image: "",
  type: "bottom",
  description: "bottom description",
  category_id: alteration_category_extend.id 
})

# Services

Repo.insert!(%Service{
  clothe_id: clothe_dress.id,
  alteration_id: alteration_commons_hem.id,
  value_base: 15.00,
})
