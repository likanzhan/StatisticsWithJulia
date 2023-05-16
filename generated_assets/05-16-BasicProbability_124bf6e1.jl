### A Pluto.jl notebook ###
# v0.19.25

#> [frontmatter]
#> chapter = 2
#> section = 3
#> order = 14
#> title = "集合简介"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "CH02"]
#> description = ""


using Markdown
using InteractiveUtils

# ╔═╡ 7606b57e-64cc-4c4b-b60d-4fd2824844da
using StatsBase: sample

# ╔═╡ fb9881d9-ef62-4d6c-b75e-ff0a02b82b8e
using Statistics: mean

# ╔═╡ 5672e2fd-3514-43cf-b6da-eca37910865c
using Random

# ╔═╡ 1da6fad8-f38f-11ed-0e16-419472eabf41
md"""
### `Julia` 中的集合
"""

# ╔═╡ 21a80ebb-3f38-4d67-b62d-9d116bf3603e
A1, B1, Ω1 = Set([2, 7, 2, 3]), Set(1:6), Set(1:10)

# ╔═╡ d3920162-8931-4647-8c34-13e58eab65f5
# @doc Set

# ╔═╡ 9636feba-d051-4333-9874-6a075015ef38
# String vs string()

# ╔═╡ a9fe6b86-6574-4191-bee5-896183c32fcc
union(A1, B1)

# ╔═╡ a0c42656-1a1e-404c-b86e-f209d444363f
intersect(A1, B1) # 交集

# ╔═╡ faf172bd-8e43-4394-8534-8d705929371a
setdiff(B1, A1)

# ╔═╡ 6423a340-e73d-41bb-92bb-770298cd779c
setdiff(Ω1, B1)

# ╔═╡ 46247de1-3d31-4f7f-b191-77ed85d9aa87
symdiff(B1, A1)

# ╔═╡ 15a1d487-d9ac-4742-aeee-b93e28f61c29
setdiff(union(A1, B1), intersect(A1, B1))

# ╔═╡ 15783798-4a9a-4a7f-9dad-36311b89cd69
in(1, B1)

# ╔═╡ 1de3f2fc-ccfe-42a9-8702-e9f9a3520492
1 ∈ B1 # \in + tab

# ╔═╡ 8bb33f93-c7eb-49a4-a7ee-a7ee07e0ccb0
issubset(A1, Ω1)

# ╔═╡ b5873c00-d735-491f-b0f1-5b93d022084b
A1 ⊆ Ω1 # \subset vs \subseteq

# ╔═╡ bdf6a6f0-0041-4029-bd00-5d4aae318a17
Ω1 ⊆ Ω1 # \Omega + tab

# ╔═╡ 1c57ddc1-94af-4cd9-8503-d575e66823ad
# Ω1 ⊂ Ω1 # false

# ╔═╡ 44dfe2d7-2cdc-4084-aa29-34a97b31cc1b
md"""
### 概率的合集
"""

# ╔═╡ e5d890ab-0415-4375-8ba4-fb6ca7a36122
Ω = 'a':'z'

# ╔═╡ 1380c47d-4c54-4bef-893f-78ce65392d0d
A = Set(['a', 'e', 'i', 'o', 'u'])

# ╔═╡ f49cca3f-d6fe-4f82-8169-d93989b0fde7
C = Set(['a', 'b', 'c'])

# ╔═╡ 68b85054-a7ef-4799-8acf-68b195d9551a
B = Set(['x', 'y', 'z'])

# ╔═╡ 894c82ba-0637-4a77-a0ba-b40736a08475
intersect(A, C)

# ╔═╡ 4763a36c-84fe-4878-86da-1da6f63033f4
intersect(A, B)

# ╔═╡ a54807c8-3893-45ac-9410-46bee01dba06
N, n = 10^5, 10^2

# ╔═╡ b62ff8e9-3d3a-4c18-a2bc-d5743b7e241e
Est1() = let
	# Random.seed!(1)
	sum(rand(Ω) ∈ union(A, B) for _ in 1:N) / N
end

# ╔═╡ 586d1b79-5ef7-40c9-ba5c-3676904ba753
mcEst1 = let
	Random.seed!(1)
	mean(Est1() for _ in 1:n)
end

# ╔═╡ 6908f590-931f-4f8b-bc93-663651d301c7
# @doc sample

# ╔═╡ b8d3b384-1bfe-4528-9b7d-0c44bb7fd6db
Est2() = let
	# Random.seed!(1)
	sum((rand(Ω) ∈ A) || (rand(Ω) ∈ B) for _ in 1:N) / N
	# sum((ω = rand(Ω); (ω ∈ A) || (ω ∈ B)) for _ in 1:N) / N
end

# ╔═╡ 914bd59d-8657-4b9b-a1dc-887c6a5fe257
mcEst2 = let
	Random.seed!(1)
	mean(Est2() for _ in 1:n)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
StatsBase = "~0.34.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "469963d64f9d1d86f0a06fad3296ef263d4d7148"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Compat]]
deps = ["UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.2+0"

[[deps.DataAPI]]
git-tree-sha1 = "8da84edb865b0b5b0100c0666a9bc9a0b71c553c"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.15.0"

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

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "0a1b7c2863e44523180fdb3146534e265a91870b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.23"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.OrderedCollections]]
git-tree-sha1 = "d321bf2de576bf25ec4d3e4360faca399afca282"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "45a7769a04a3cf80da1c1c7c60caf932e6f4c9f7"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.6.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "75ebe04c5bed70b91614d684259b661c9e6274a4"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.7.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─1da6fad8-f38f-11ed-0e16-419472eabf41
# ╠═21a80ebb-3f38-4d67-b62d-9d116bf3603e
# ╠═d3920162-8931-4647-8c34-13e58eab65f5
# ╠═9636feba-d051-4333-9874-6a075015ef38
# ╠═a9fe6b86-6574-4191-bee5-896183c32fcc
# ╠═a0c42656-1a1e-404c-b86e-f209d444363f
# ╠═faf172bd-8e43-4394-8534-8d705929371a
# ╠═6423a340-e73d-41bb-92bb-770298cd779c
# ╠═46247de1-3d31-4f7f-b191-77ed85d9aa87
# ╠═15a1d487-d9ac-4742-aeee-b93e28f61c29
# ╠═15783798-4a9a-4a7f-9dad-36311b89cd69
# ╠═1de3f2fc-ccfe-42a9-8702-e9f9a3520492
# ╠═8bb33f93-c7eb-49a4-a7ee-a7ee07e0ccb0
# ╠═b5873c00-d735-491f-b0f1-5b93d022084b
# ╠═bdf6a6f0-0041-4029-bd00-5d4aae318a17
# ╠═1c57ddc1-94af-4cd9-8503-d575e66823ad
# ╟─44dfe2d7-2cdc-4084-aa29-34a97b31cc1b
# ╠═e5d890ab-0415-4375-8ba4-fb6ca7a36122
# ╠═1380c47d-4c54-4bef-893f-78ce65392d0d
# ╠═f49cca3f-d6fe-4f82-8169-d93989b0fde7
# ╠═68b85054-a7ef-4799-8acf-68b195d9551a
# ╠═894c82ba-0637-4a77-a0ba-b40736a08475
# ╠═4763a36c-84fe-4878-86da-1da6f63033f4
# ╠═a54807c8-3893-45ac-9410-46bee01dba06
# ╠═7606b57e-64cc-4c4b-b60d-4fd2824844da
# ╠═fb9881d9-ef62-4d6c-b75e-ff0a02b82b8e
# ╠═5672e2fd-3514-43cf-b6da-eca37910865c
# ╠═b62ff8e9-3d3a-4c18-a2bc-d5743b7e241e
# ╠═586d1b79-5ef7-40c9-ba5c-3676904ba753
# ╠═6908f590-931f-4f8b-bc93-663651d301c7
# ╠═b8d3b384-1bfe-4528-9b7d-0c44bb7fd6db
# ╠═914bd59d-8657-4b9b-a1dc-887c6a5fe257
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
