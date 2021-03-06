/obj/item/reagent_containers/food/snacks/baked
	filling_color = "#E0CF9B"
	icon = 'icons/obj/kitchen/staples/baked.dmi'

/obj/item/reagent_containers/food/snacks/baked/initialize()
	..()
	reagents.add_reagent(REAGENT_ID_NUTRIMENT, 6)

/obj/item/reagent_containers/food/snacks/baked/muffin
	name = "muffin"
	desc = "A delicious and spongy little cake."
	icon_state = "muffin"

/obj/item/reagent_containers/food/snacks/baked/waffles
	name = "waffles"
	gender = PLURAL
	desc = "Mmm, waffles."
	icon_state = "waffles"

/obj/item/reagent_containers/food/snacks/baked/bun
	name = "bun"
	desc = "A base for any self-respecting burger."
	icon_state = "bun"

/obj/item/reagent_containers/food/snacks/baked/flatbread
	name = "flatbread"
	desc = "Bland but filling."
	icon_state = "flatbread"

/obj/item/reagent_containers/food/snacks/baked/cracker
	name = "cracker"
	desc = "It's a salted cracker."
	icon_state = "cracker"

/obj/item/reagent_containers/food/snacks/baked/bread
	name = "bread"
	icon_state = "Some plain old Earthen bread."
	icon_state = "bread"
	slices_to = /obj/item/reagent_containers/food/snacks/baked/breadslice
	slice_count = 4

/obj/item/reagent_containers/food/snacks/baked/breadslice
	name = "bread slice"
	desc = "A slice of home."
	icon_state = "breadslice"

/obj/item/reagent_containers/food/snacks/raw_pretzel
	name = "raw pretzel"
	desc = "A rolled segment of dough."
	icon = 'icons/obj/kitchen/staples/dough.dmi'
	icon_state = "rolled dough"

/obj/item/reagent_containers/food/snacks/baked/pretzel
	name = "pretzel"
	desc = "It's all twisted up!"
	icon_state = "poppypretzel"

/obj/item/reagent_containers/food/snacks/baked/baguette
	name = "baguette"
	desc = "Bon appetit!"
	icon_state = "baguette"
	bitesize = 3

/obj/item/reagent_containers/food/snacks/baked/cookie
	name = "cookie"
	desc = "A small, delicious biscuit"
	icon_state = "COOKIE!!!"
	bitesize = 1
