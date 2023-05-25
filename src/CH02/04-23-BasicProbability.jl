### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> chapter = 2
#> section = 2
#> order = 14
#> title = "容斥原理"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "CH02"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 2541939a-f90f-11ed-0109-ed7226fd5fd5
using Combinatorics: factorial, permutations

# ╔═╡ 3d8aa6d8-1228-48d3-9c98-3c710ade7322
using Random

# ╔═╡ 350ed019-d94e-4e6b-84ae-af7f2eb83ee9
function bruteSetsProbabilityAllMiss(n)
	Ω = permutations(1:n)
	# notmatch = [sum(om .== 1:n) == 0 for om in Ω]
	notmatch = [!any(om .== 1:n) for om in Ω]
	return sum(notmatch) / length(Ω)
end

# ╔═╡ db8f1543-23d3-4054-b3d7-1e8db7c09965
omega = collect(permutations(1:5))

# ╔═╡ da2d2d0a-d175-432d-926a-43ba26e14218
om = omega[end-4]

# ╔═╡ 40850bdb-4dce-4da7-b738-846066f9e804
collect(1:5)

# ╔═╡ f31db04e-2c8e-433e-a8e6-6417ee51161d
sum(om .== 1:5) == 0 # dot .

# ╔═╡ b45406cd-0590-498c-bc36-acb238bcc3bb
notmatch = [sum(om .== 1:5) == 0 for om in omega]

# ╔═╡ 04a5d8c2-ceaa-45c6-92c7-ef95da759ba0
sum(notmatch) / length(omega)

# ╔═╡ d1741718-9edd-43fa-a666-0f614edf3ac7
omega[notmatch]

# ╔═╡ 5f01c385-93cd-4d14-b18c-a574f76cdc22
bruteSetsProbabilityAllMiss(7)

# ╔═╡ 2fee616a-2cd8-4c82-9c6b-945a142600f8
formulaCalcAllMiss(n) = sum((-1)^k / factorial(k) for k in 0:n)

# ╔═╡ 6e160fdd-f7f1-4b6c-869e-923797c12c3e
formulaCalcAllMiss(7)

# ╔═╡ 3eede7af-2b33-4115-8cb9-ebc8a4fcd336
Random.shuffle!(collect(1:5))

# ╔═╡ 722b4169-a5e2-4136-b85e-110b6ae42bda
function mcAllMiss(n, N = 10^6)
	function cardsStuffer()
		cards = Random.shuffle!(collect(1:n))
		return !any(cards .== 1:n) # 注意： ！ 的使用
	end
	data = [cardsStuffer() for _ in 1:N]
	return sum(data) / N
end

# ╔═╡ d721f1a9-6a17-4f72-8377-c30d53f6c271
let
	Random.seed!(1)
	mcAllMiss(7)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Combinatorics = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[compat]
Combinatorics = "~1.0.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "ccc200d4efd8889f0534966e4807c3d3e8e2fbee"

[[deps.Combinatorics]]
git-tree-sha1 = "08c8b6831dc00bfea825826be0bc8336fc369860"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.0.2"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
"""

# ╔═╡ Cell order:
# ╠═2541939a-f90f-11ed-0109-ed7226fd5fd5
# ╠═350ed019-d94e-4e6b-84ae-af7f2eb83ee9
# ╠═db8f1543-23d3-4054-b3d7-1e8db7c09965
# ╠═da2d2d0a-d175-432d-926a-43ba26e14218
# ╠═40850bdb-4dce-4da7-b738-846066f9e804
# ╠═f31db04e-2c8e-433e-a8e6-6417ee51161d
# ╠═b45406cd-0590-498c-bc36-acb238bcc3bb
# ╠═04a5d8c2-ceaa-45c6-92c7-ef95da759ba0
# ╠═d1741718-9edd-43fa-a666-0f614edf3ac7
# ╠═5f01c385-93cd-4d14-b18c-a574f76cdc22
# ╠═2fee616a-2cd8-4c82-9c6b-945a142600f8
# ╠═6e160fdd-f7f1-4b6c-869e-923797c12c3e
# ╠═3d8aa6d8-1228-48d3-9c98-3c710ade7322
# ╠═3eede7af-2b33-4115-8cb9-ebc8a4fcd336
# ╠═722b4169-a5e2-4136-b85e-110b6ae42bda
# ╠═d721f1a9-6a17-4f72-8377-c30d53f6c271
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
