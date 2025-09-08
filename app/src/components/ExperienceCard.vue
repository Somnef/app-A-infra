<template>
	<a
		:href="link"
		target="_blank"
		class="w-full lg:w-[95%] flex lg:flex-row flex-col p-0 lg:p-[1rem] bg-dark-grey bg-opacity-0 group hover:cursor-pointer hover:bg-opacity-75 transition-all ease-in-out duration-300"
	>
		<div
			class="lg:w-[10%] lg:h-full w-full h-[10%] lg:text-sm text-[0.7rem] text-center text-middle-grey my-auto lg:group-hover:-translate-y-[0.5rem] lg:group-hover:translate-x-0  group-hover:translate-x-[0.5rem]  transition-all ease-in-out duration-300"
		>
			{{ date.split("-")[1] }}

			<br v-if="!isMobile()" />

			<span v-if="isMobile()"> - </span>

			<span v-if="!isMobile()">↑</span>

			<br v-if="!isMobile()" />
			{{ date.split("-")[0] }}
		</div>

		<div
			class="ml-[1rem] lg:w-[90%] lg:h-full w-full h-[90%] text-light-grey"
		>
			<div
				class="lg:text-2xl text-lg font-semibold group-hover:text-green-tech group-hover:translate-x-[0.5rem] transition-all ease-in-out duration-300"
			>
				{{ title }}
			</div>
			<div
				class="lg:text-lg text-sm font-semibold group-hover:translate-x-[0.5rem] transition-all ease-in-out duration-300"
			>
				@{{ company }}
			</div>
			<div
				class="lg:text-sm text-xs text-middle-grey mt-[0.5rem] group-hover:translate-x-[0.5rem] transition-all ease-in-out duration-300"
			>
				<ul class="list-disc">
					<li v-for="desc in description">{{ desc }}</li>
				</ul>
				
			</div>

			<div
				v-if="techs.length > 0"
				class="lg:text-sm text-xs text-green-tech mt-[0.5rem] group-hover:translate-x-[0.5rem] transition-all ease-in-out duration-300"
			>
				<p class="text-light-grey">Techs used:</p>

				<div
					class="grid lg:grid-cols-4 grid-cols-2 mt-[0.5rem] gap-y-[0.5rem] items-center justify-center text-xs"
				>
					<div
						v-for="tech in techs"
						class="flex items-center text-green-tech mr-[1rem] h-full px-2 pt-[0.1rem] pb-[0.2rem] border border-light-grey"
					>
						{{ tech }}
					</div>
				</div>
			</div>
		</div>
	</a>
</template>

<script>
export default {
	props: {
		date: String,
		title: String,
		company: String,
		description: String,
		techs: Array,
		link: String,
	},

	methods: {
		isMobile() {
			if (
				/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
					navigator.userAgent
				)
			) {
				return true;
			} else {
				return false;
			}

			// return true
		},
	},
};
</script>
