<template>
	<div
		@click="projectClicked()"
		class="w-full h-full flex flex-col lg:p-[1rem] lg:my-0 p-[.5rem] my-[1rem] bg-dark-grey bg-opacity-0 group hover:cursor-pointer hover:bg-opacity-85 transition-all ease-in-out duration-300"
	>
		<div
			class="lg:text-2xl text-lg underline font-semibold text-light-grey text-center group-hover:text-green-tech group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300"
		>
			{{ title }}
		</div>

		<div
			class="lg:text-sm text-sm text-middle-grey text-center mt-[0.5rem] group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300"
		>
			{{ description.substring(0, 90) }}...
		</div>

		<img
			:src="image"
			class="w-full lg:h-[10rem] h-[8rem] object-contain lg:mt-[1rem] mt-[0.5rem] group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300"
		/>
	</div>
</template>

<script>
export default {
	emits: ["projectClicked"],

	props: {
		title: String,
		description: String,
		image: String,
		image2: String,
		techs: Array,
		links: Object,
		type: String,
	},

	methods: {
		projectClicked() {
			const pass_info = {
				title: this.title,
				description: this.description,
				techs: this.techs,
				image: this.image,
				image2: this.image2,
				links: this.links,
			};

			this.$emit("projectClicked", pass_info);
		},
	},
};
</script>
