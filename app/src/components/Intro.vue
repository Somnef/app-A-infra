<template>
	<!-- <div class="flex flex-col items-center w-full h-full bg-red-300 "> -->

    <div class="lg:fixed absolute w-0 flex justify-center items-center ransition-all ease-in-out duration-[1.5s]"
        :class="
            intro_done
                ? 'lg:w-[5%] h-[10vh] top-0 left-0 ml-[3%] mt-[27.5vh]'
                : 'lg:w-[10%] top-1/2 left-[15%] -translate-y-1/2 ml-0 mt-0'
            "
    >
        <img src="/images/avatar.png" class="w-fit animate-[wiggle_1s_ease-in-out_infinite] transition-all ease-in-out duration-[1.5s] delay-[0.5s]" :class="show_text ? 'opacity-100' : 'opacity-0'">
    </div>

	<div
		class="lg:fixed absolute flex flex-col lg:items-start items-center lg:w-1/2 w-[80%] transition-all ease-in-out duration-[1.5s]"
		:class="
			intro_done
				? 'top-0 lg:left-0 lg:translate-x-0 left-1/2 -translate-x-1/2 lg:ml-[3%] lg:mt-[5rem] mt-[3rem]'
				: 'top-1/2 lg:left-[30%] left-[50%] lg:translate-x-0 -translate-x-1/2 -translate-y-1/2 ml-0 mt-0'
		"
	>
		<div
			class="text-3xl lg:text-5xl text-light-grey transition-all ease-in-out duration-[1.5s] delay-[1s]"
			:class="show_text ? 'opacity-100' : 'opacity-0'"
		>
			<span v-if="!intro_done">
            Hey, my name is
			</span>
			<span
				class="text-green-tech hover:text-light-grey font-semibold transition-all ease-in-out duration-[1s]"
				>Bousselat Moncef</span
			>
			<span
				class="transition-all ease-in-out duration-[1s]"
				:class="intro_done ? 'opacity-0' : 'opacity-100'"
				>.</span
			>
		</div>

		<div
			class="text-lg lg:text-3xl lg:mt-[0.5rem] mt-[0.5rem] text-light-grey transition-all ease-in-out duration-[1.5s] delay-[1.75s]"
			:class="show_text ? 'opacity-100' : 'opacity-0'"
		>
			<span v-if="!intro_done">
                I am a
			</span>
			<span
				class="transition-all ease-in-out duration-[3s]"
				:class="
					intro_done
						? 'text-xs lg:text-xl text-light-grey'
						: 'text-xl lg:text-3xl text-green-tech'
			">
				Cloud 
				<span class="text-light-grey">&</span> 
				DevOps Engineer</span>
			<span
				class="transition-all ease-in-out duration-[1s]"
				:class="intro_done ? 'opacity-0' : 'opacity-100'"
			>.
			</span>
		</div>

		<div
			class="lg:mt-[0.5rem] lg:ml-0 text-middle-grey text-xs lg:text-sm transition-all ease-in-out duration-[1.5s] delay-[2.5s]"
			:class="intro_done ? 'opacity-100' : 'opacity-0'"
		>
			I build solutions and deploy them to the cloud.
		</div>

		<div
			class="transition-all duration-300 w-full flex items-center lg:justify-start justify-center"
			:class="
				intro_done ? 'opacity-0 pointer-events-none' : 'opacity-100'
			"
		>
			<div
				@click="signalIntroDone()"
				class="text-lg lg:text-2xl w-[10rem] lg:w-[20rem] text-light-grey border-2 border-light-grey transition-all ease-in-out duration-[1.5s] delay-[2s]"
				:class="
					show_text
						? 'opacity-100 pointer-events-auto'
						: 'opacity-0 pointer-events-none'
				"
			>
				<div
					class="w-full h-full px-4 py-2 text-center bg-dark-grey hover:bg-green-tech hover:cursor-pointer transition-all ease-in-out duration-300"
					:class="
						intro_done
							? 'pointer-events-none'
							: 'pointer-events-auto'
					"
				>
					Learn more
				</div>
			</div>
		</div>
	</div>

	<!-- </div> -->
</template>

<script>
export default {
	name: "Intro",

	emits: ["introIsDone"],

	data() {
		return {
			intro_done: false,
			show_text: false,
		};
	},

	methods: {
		signalIntroDone() {
			this.intro_done = true;

			setTimeout(() => {
				this.$emit("introIsDone", true);
			}, 3000);
		},
	},

	mounted() {
		setTimeout(() => {
			this.show_text = true;
		}, 100);
	},
};
</script>

<style>
@keyframes wiggle {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-3px); }
}
</style>