<template>
	<div
		class="w-full mb-[3rem] flex flex-col items-center justify-center lg:items-start lg:justify-start"
	>
		<div class="lg:text-5xl text-3xl font-semibold">Tech stack</div>
		<div class="mt-[0.75rem] h-[1px] w-3/4 bg-middle-grey"></div>

		<!-- Search bar -->
		<div
			class="flex items-center justify-center w-full mt-[1rem] lg:text-base text-sm text-light-grey"
		>
			<input
				v-model="search"
				class="lg:w-1/2 w-full lg:h-[2rem] h-[2.5rem] bg-dark-grey text-light-grey border border-middle-grey rounded-lg p-[0.5rem] focus:outline-none"
				placeholder="Search for a technology..."
			/>
		</div>

		<div
			v-for="category in categories"
			class="lg:pl-[1rem] pl-0 flex flex-col items-center justify-center lg:items-start lg:justify-start"
		>
			<div
				class="w-full mt-[1rem] lg:text-base text-sm text-light-grey lg:text-start text-center"
			>
				{{ category }}
			</div>
			<div class="mt-[0.75rem] h-[1px] w-1/2 bg-middle-grey"></div>

			<div
				class="w-full mt-[1rem] lg:text-base text-sm text-light-grey grid lg:grid-cols-7 grid-cols-4 lg:gap-x-[1rem] lg:gap-y-[0.5rem] gap-x-[0.5rem] gap-y-[1rem] items-center"
			>
				<TechCard
					v-for="tech in techsInCat(category)"
					:name="tech.name"
					:image="tech.image"
				/>
			</div>
		</div>
	</div>
</template>

<script>
import TechCard from "./TechCard.vue";

export default {
	name: "Techs",

	components: {
		TechCard,
	},

	data() {
		return {
			techs: [
				{
					name: "Python",
					image: '<i class="devicon-python-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "JavaScript",
					image: '<i class="devicon-javascript-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "BASH",
					image: '<i class="devicon-bash-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "Java",
					image: '<i class="devicon-java-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "C",
					image: '<i class="devicon-c-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "C++",
					image: '<i class="devicon-cplusplus-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "PHP",
					image: '<i class="devicon-php-plain" style="font-size:40px;"></i>',
					category: "Programming languages",
				},
				{
					name: "Laravel",
					image: '<i class="devicon-laravel-plain" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "Node.js",
					image: '<i class="devicon-nodejs-plain" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "Flask",
					image: '<i class="devicon-flask-original" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "FastAPI",
					image: '<i class="devicon-fastapi-plain" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "Vue.js",
					image: '<i class="devicon-vuejs-plain" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "React.js",
					image: '<i class="devicon-react-original" style="font-size:40px;"</i>',
					category: "Web frameworks",
				},
				{
					name: "Tailwind",
					image: '<i class="devicon-tailwindcss-original" style="font-size:40px;"></i>',
					category: "Web frameworks",
				},
				{
					name: "Numpy",
					image: '<i class="devicon-numpy-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "Pandas",
					image: '<i class="devicon-pandas-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "Matplotlib",
					image: '<i class="devicon-matplotlib-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "Scikit-learn",
					image: '<i class="devicon-scikitlearn-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "PyTorch",
					image: '<i class="devicon-pytorch-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "TensorFlow",
					image: '<i class="devicon-tensorflow-original" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "AWS",
					image: '<i class="devicon-amazonwebservices-plain-wordmark" style="font-size:40px;"></i>',
					category: "Cloud service providers",
				},
				{
					name: "DigitalOcean",
					image: '<i class="devicon-digitalocean-original" style="font-size:40px;"></i>',
					category: "Cloud service providers",
				},
				{
					name: "Terraform",
					image: '<i class="devicon-terraform-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "MongoDB",
					image: '<i class="devicon-mongodb-plain" style="font-size:40px;"></i>',
					category: "Databases",
				},
				{
					name: "MySQL",
					image: '<i class="devicon-mysql-plain" style="font-size:40px;"></i>',
					category: "Databases",
				},
				{
					name: "Git",
					image: '<i class="devicon-git-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "GitHub Actions",
					image: '<i class="devicon-githubactions-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "Docker",
					image: '<i class="devicon-docker-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "Kubernetes",
					image: '<i class="devicon-kubernetes-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "Prometheus",
					image: '<i class="devicon-prometheus-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "Grafana",
					image: '<i class="devicon-grafana-plain" style="font-size:40px;"></i>',
					category: "Cloud & DevOps tools",
				},
				{
					name: "Jupyter",
					image: '<i class="devicon-jupyter-plain" style="font-size:40px;"></i>',
					category: "Data science & AI",
				},
				{
					name: "Unity",
					image: '<i class="devicon-unity-plain" style="font-size:40px;"></i>',
					category: "Others",
				},
			],

			categories: [
				"Cloud service providers",
				"Cloud & DevOps tools",
				"Databases",
				"Programming languages",
				"Web frameworks",
				"Data science & AI",
				"Others",
			],

			search: "",

			// font_size: 40,
		};
	},

	computed: {
		filteredTechs() {
			return this.techs.filter((tech) =>
				tech.name.toLowerCase().includes(this.search.toLowerCase())
			);
		},

		// categories() {
		//     return this.filteredTechs.map(tech => tech.category).filter((value, index, self) => self.indexOf(value) === index);
		// },

		font_size() {
			return this.isMobile() ? 40 : 50;
		},

		sizeClass() {
			return "text-[" + this.font_size + "px]";
		},
	},

	methods: {
		techsInCat(category) {
			return this.filteredTechs.filter(
				(tech) => tech.category === category
			);
		},

		// getImageTag(image) {
		// 	// This function adds :class="sizeClass" to the image tag
		// 	// and returns the image tag with the class added

		// 	// '<i class="devicon-numpy-plain" style="font-size:40px;"></i>'

		// 	return image.replace('class="', 'class="' + this.sizeClass + " ");

		// 	return image;
		// },

		// isMobile() {
		// 	// return true;

		// 	if (
		// 		/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
		// 			navigator.userAgent
		// 		)
		// 	) {
		// 		return true;
		// 	} else {
		// 		return false;
		// 	}
		// },
	},

	// mounted() {
	//     this.font_size = this.isMobile() ? 20 : 40;
	//     // this.font_size = 40;
	// }
};
</script>
