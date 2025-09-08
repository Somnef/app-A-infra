<template>
	<!-- <div class="fixed top-0 left-0 text-xl text-light-grey z-50">
        Scroll Percentage: {{ scroll_percentage }}%
    </div> -->

	<Background />
	<MouseFollower />

	<Modal :info="modal_info" :show="show_modal" @closeModal="hideModal()" />

	<Intro @introIsDone="introIsDone()" />

	<div class="relative w-full 2xl:w-[75%] xl:w-[70%] lg:w-[65%] h-full lg:ml-auto ml-0 text-light-grey lg:pl-[6rem] lg:pr-[2rem] lg:py-[5rem] px-[2rem] pt-[18rem] pb-[3rem] z-10 transition-all ease-in-out duration-[0.5s]"
		:class="intro_done ? 'opacity-100' : 'opacity-0 pointer-events-none'">
		<About id="about" @contactClicked="scrollIntoView('contact')" @hideClicked="hideShowAbout()" :hide="hide_about"/>
		<Certifications id="certs" />
		<Projects @projectClicked="showModal" id="projects" />
		<Techs id="techs" />
		<!-- <Current id="current"/> -->
		<Experience id="experience" />
		<Contact id="contact" />

		<Nav :current="current_view" @navClicked="scrollIntoView" />

		<SocialMedia />

		<Acknowledgement />
	</div>
</template>

<script>
import { inject } from "@vercel/analytics";
inject();

import Background from "./components/Background.vue";
import Intro from "./components/Intro.vue";
import About from "./components/About.vue";
import Current from "./components/Current.vue";
import Experience from "./components/Experience.vue";
import Projects from "./components/Projects.vue";
import Modal from "./components/Modal.vue";
import Contact from "./components/Contact.vue";
import Nav from "./components/Nav.vue";
import SocialMedia from "./components/SocialMedia.vue";
import Acknowledgement from "./components/Acknowledgement.vue";
import MouseFollower from "./components/MouseFollower.vue";
import Techs from "./components/Techs.vue";
import Certifications from "./components/Certifications.vue";

export default {
	components: {
		Background,
		MouseFollower,
		Intro,
		About,
		Current,
		Experience,
		Projects,
		Modal,
		Contact,
		Nav,
		SocialMedia,
		Acknowledgement,
		Techs,
		Certifications
	},

	data() {
		return {
			intro_done: false,
			hide_about: false,

			show_modal: false,
			modal_info: {
				title: "",
				description: "",
				techs: [],
				image: "",
				image2: "",
				links: {},
			},

			current_view: "about",

			scroll_percentage: 0,

			section_percentage: {
				about: 0,
				certs: 5,
				projects: 45,
				techs: 70,
				// current: 20,
				experience: 90,
				contact: 100,
			}
		};
	},

	methods: {
		introIsDone() {
			this.intro_done = true;
		},

		showModal(info) {
			this.show_modal = true;
			this.modal_info = info;
		},

		hideModal() {
			this.show_modal = false;

			setTimeout(() => {
				this.modal_info = {
					title: "",
					description: "",
					techs: [],
					image: "",
					image2: "",
					links: {},
				};
			}, 100);
		},

		scrollIntoView(id) {
			// console.log('scroll into view: ' + id);

			const el = document.getElementById(id);
			el.scrollIntoView({ behavior: "smooth" });

			this.current_view = id;
		},

		calculateScrollPercentage() {
			const scrollTop =
				window.pageYOffset || document.documentElement.scrollTop;
			const scrollHeight =
				document.documentElement.scrollHeight - window.innerHeight;

			// Calculate the scroll percentage
			this.scroll_percentage = Math.round(
				(scrollTop / scrollHeight) * 100
			);
		},

		hideShowAbout() {
			this.hide_about = !this.hide_about;
		}
	},

	watch: {
		hide_about(newValue) {
			if (newValue) {
				this.section_percentage = {
					about: 0,
					certs: 7,
					projects: 45,
					techs: 70,
					// current: 20,
					experience: 90,
					contact: 100,
				}
			}
			else {
				this.section_percentage = {
					about: 5,
					certs: 10,
					projects: 50,
					techs: 75,
					// current: 20,
					experience: 95,
					contact: 100,
				}
			}


		},

		scroll_percentage(newValue) {
			if (newValue >= 0 && newValue < this.section_percentage.about) {
				this.current_view = "about";
			}
			else if (newValue >= this.section_percentage.about && newValue < this.section_percentage.certs) {
				this.current_view = "certs";
			} 
			else if (newValue >= this.section_percentage.certs && newValue < this.section_percentage.projects) {
				this.current_view = "projects";
			} 
			else if (newValue >= this.section_percentage.projects && newValue < this.section_percentage.techs) {
				this.current_view = "techs";
			}
			else if (newValue >= this.section_percentage.techs && newValue < this.section_percentage.experience) {
				this.current_view = "experience";
			} 
			else if (newValue >= this.section_percentage.experience && newValue <= this.section_percentage.contact) {
				this.current_view = "contact";
			} 
			else {
				this.current_view = "about";
			}
		},
	},

	mounted() {
		console.log(
			"Hey, interested in how I made this website ? Get in touch with me at: a.m.bousselat@gmail.com !"
		);

		// scroll to the top of the page
		window.scrollTo(0, 0);

		window.addEventListener("scroll", this.calculateScrollPercentage);
	},

	beforeDestroy() {
		window.removeEventListener("scroll", this.calculateScrollPercentage);
	},
};
</script>

<style scoped></style>
