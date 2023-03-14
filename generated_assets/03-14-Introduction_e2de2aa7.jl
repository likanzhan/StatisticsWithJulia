### A Pluto.jl notebook ###
# v0.19.22

#> [frontmatter]
#> chapter = 1
#> section = 3
#> order = 8
#> title = "马科夫链"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "CH01"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ cf5b03fc-1c5b-46e9-aeda-69c52c753dc0
using Roots # find_zeros()

# ╔═╡ aa10c3c1-880c-4b54-b425-c3c13ffad051
using LinearAlgebra

# ╔═╡ c929944e-17c5-407c-a39f-73577578c51a
using StatsBase: sample, weights

# ╔═╡ 27390550-c20f-11ed-3cd4-bff6756ed2c2
md"""
### 多项式的根
"""

# ╔═╡ 99f7eaf4-8905-4c81-bd77-7676bf2bef7f
f(x) = -10x^2 + 3x + 1

# ╔═╡ d460ff27-e80c-408e-99b1-e6138c30182c
f(10)

# ╔═╡ 3a5acd31-7e2f-4473-9048-53e66eeffee9
find_zeros(f, -10, 10)

# ╔═╡ 8768bdee-2f0d-4fd8-bfc3-2555bd1cb5f7
md"""
### 马科夫链
"""

# ╔═╡ 071511f0-90d4-4e62-9a95-6667179b31a0
P = [0.5 0.4 0.1;
	 0.3 0.2 0.5;
	 0.5 0.3 0.2]

# ╔═╡ b4cd72e8-3a25-4d60-bacd-5f7e0a05dc7e
P1 = P'

# ╔═╡ 1e347e76-3cea-4ac4-aee5-15a0e453f191
typeof(P)

# ╔═╡ c0ac2ff3-7032-45a7-9748-ddbadcd24f26
InitialState = [1 0 0; 0 1 0; 0 0 1]

# ╔═╡ c5a772e0-429c-46c3-bbb2-7bf265b28a37
InitialState * P^100

# ╔═╡ 12ea2861-8469-483f-81af-0a087e10499e
A = rand(4, 4) #reshape(1:16, 4, 4)

# ╔═╡ f45bd692-1ac1-4302-9f91-04e28c4496da
A[[2, 2]]

# ╔═╡ 9a6bed5a-e8b4-48cd-b3cc-00a97930fe53
A[2, 2]

# ╔═╡ e735853f-be9c-4c5f-9a44-4c86b8c3eade
P[1, :]

# ╔═╡ a2ced56b-88ee-450f-8eb1-709771120951
P[1, 2]

# ╔═╡ 5004a113-8d02-4dff-a8a3-48dd6d570d9c
(P^10)[1, :]

# ╔═╡ f15c1b34-59cf-4269-9a9a-acf1dfce6f0d
eigvecs(P')

# ╔═╡ ec1d0625-d882-40a1-bcbb-f51e7284adab
eigvals(P')

# ╔═╡ e341848b-9059-4b94-8ce8-ba5708ee0a42
md"""
蒙特卡洛模拟
"""

# ╔═╡ 4903e8d2-c5d7-4c3b-bd82-973fddbe4ab8
md"""
`x += 1` 等价于 `x = x + 1` 
"""

# ╔═╡ 93694d3c-2919-4e68-92a6-d5e6957220d4
sample(1:3)

# ╔═╡ 3af81db5-3206-4efe-bde7-9e9aef344d9b
P[1, :]

# ╔═╡ 4808cb46-adce-4340-8fb1-44e6de561d4b
ss = [sample(1:3, weights(P[1, :])) for _ in 1:10^6]

# ╔═╡ 083e510e-bd4e-4765-a4aa-45316bf41055
[length(ss[ss .== x]) / 10^6 for x in 1:3]

# ╔═╡ 8bcea266-e8be-4a8d-8fe6-0773fa347a11
rand(["x", "y", "z"])

# ╔═╡ a9a6cc6d-f50b-4250-ae56-f02e27e2be6e
zeros(Int64, 3)

# ╔═╡ 36b48312-cb46-43be-a585-ecf936992c1a
P

# ╔═╡ fe88fc5e-0acf-48a2-a783-1556b20d95a9
begin
	state = Ref(1)
	N = 10^6
	numInState = zeros(Int64, 3)
	for _ in 1:N
		numInState[state[]] += 1
		state[] = sample(1:3, weights(P[state, :]))
	end
end

# ╔═╡ bffad3b3-d7e9-4274-bcf6-5a49eb0e2f59
(P^100)[1, :]

# ╔═╡ eecffbed-374f-44d1-8149-5803819516b1
numInState ./ 10^6

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Roots = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
Roots = "~2.0.10"
StatsBase = "~0.33.21"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "afa05bb008440845272fe7dfdfe7edcb86f437f1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "485193efd2176b88e6622a39a246f8c5b600e74e"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.6"

[[deps.CommonSolve]]
git-tree-sha1 = "9441451ee712d1aec22edad62db1a9af3dc8d852"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.3"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "89a9db8d28102b094992472d333674bd1a83ce2a"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Roots]]
deps = ["ChainRulesCore", "CommonSolve", "Printf", "Setfield"]
git-tree-sha1 = "b45deea4566988994ebb8fb80aa438a295995a6e"
uuid = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"
version = "2.0.10"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╟─27390550-c20f-11ed-3cd4-bff6756ed2c2
# ╠═cf5b03fc-1c5b-46e9-aeda-69c52c753dc0
# ╠═99f7eaf4-8905-4c81-bd77-7676bf2bef7f
# ╠═d460ff27-e80c-408e-99b1-e6138c30182c
# ╠═3a5acd31-7e2f-4473-9048-53e66eeffee9
# ╟─8768bdee-2f0d-4fd8-bfc3-2555bd1cb5f7
# ╠═071511f0-90d4-4e62-9a95-6667179b31a0
# ╠═b4cd72e8-3a25-4d60-bacd-5f7e0a05dc7e
# ╠═1e347e76-3cea-4ac4-aee5-15a0e453f191
# ╠═c0ac2ff3-7032-45a7-9748-ddbadcd24f26
# ╠═c5a772e0-429c-46c3-bbb2-7bf265b28a37
# ╠═12ea2861-8469-483f-81af-0a087e10499e
# ╠═f45bd692-1ac1-4302-9f91-04e28c4496da
# ╠═9a6bed5a-e8b4-48cd-b3cc-00a97930fe53
# ╠═e735853f-be9c-4c5f-9a44-4c86b8c3eade
# ╠═a2ced56b-88ee-450f-8eb1-709771120951
# ╠═5004a113-8d02-4dff-a8a3-48dd6d570d9c
# ╠═aa10c3c1-880c-4b54-b425-c3c13ffad051
# ╠═f15c1b34-59cf-4269-9a9a-acf1dfce6f0d
# ╠═ec1d0625-d882-40a1-bcbb-f51e7284adab
# ╠═e341848b-9059-4b94-8ce8-ba5708ee0a42
# ╠═4903e8d2-c5d7-4c3b-bd82-973fddbe4ab8
# ╠═c929944e-17c5-407c-a39f-73577578c51a
# ╠═93694d3c-2919-4e68-92a6-d5e6957220d4
# ╠═3af81db5-3206-4efe-bde7-9e9aef344d9b
# ╠═4808cb46-adce-4340-8fb1-44e6de561d4b
# ╠═083e510e-bd4e-4765-a4aa-45316bf41055
# ╠═8bcea266-e8be-4a8d-8fe6-0773fa347a11
# ╠═a9a6cc6d-f50b-4250-ae56-f02e27e2be6e
# ╠═36b48312-cb46-43be-a585-ecf936992c1a
# ╠═fe88fc5e-0acf-48a2-a783-1556b20d95a9
# ╠═bffad3b3-d7e9-4274-bcf6-5a49eb0e2f59
# ╠═eecffbed-374f-44d1-8149-5803819516b1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
