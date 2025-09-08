<template>
    <div class="w-full mb-[3rem] flex flex-col items-center justify-center lg:items-start lg:justify-start">
        <div class="lg:text-5xl text-3xl font-semibold flex flex-row">
			<span>About me</span>
			<span class="hover:cursor-pointer" @click="hideShow">
				<span v-if="hide">▴</span>
				<span v-else>▾</span>
			</span>
		</div>
        <div class="mt-[0.75rem] h-[1px] w-3/4 bg-middle-grey"></div>
        <div class="mt-[1rem] lg:text-sm text-xs text-middle-grey" v-if="!hide">
            <div class="flex flex-row items-center">

                <div class="lg:w-[70%] w-full">
                    <!-- <div class="lg:px-3 px-0 lg:py-1 py-0 hover:bg-dark-grey hover:text-light-grey transition-all ease-in-out duration-300 group"> -->
                        I am <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Moncef</span>,
                        a 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Cloud</span>
                        & 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">DevOps</span> 
                        engineer, who also partakes in <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">web/app development</span> projects on the side. 
                        I graduated with a Master's in 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Data Science and AI</span> 
                        from the 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Polytechnic School</span> 
                        of Algiers in 2023, and I am currently pursuing a second Master's degree in 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Green Networking and Cloud Computing</span> 
                        while travelling across Europe through the famous
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">Erasmus Mundus</span> program!
                    <!-- </div> -->


                    <br>
                    <br>
                    
                    <!-- <div class="hover:bg-dark-grey hover:text-light-grey transition-all ease-in-out duration-300 group"> -->
                        My interest in tech showed at a pretty young age, I started by learning about HTML & CSS in order
                        to customize my super cool signature on various wikis. This quickly evolved into a passion for programming, 
                        which I started learning with the goal of making my own video games.
                        Fast forward to today, I have put my hands on many different fields, from 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">web</span>
                        and 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">game development</span>
                        ,
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">machine learning</span>
                        ,
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">data science</span> and
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">cloud technologies</span>,
                        and I am always looking for new challenges to learn new things.
                    <!-- </div> -->

                    <br>
                    <br>

                    My current goal is to <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">combine my knowledge</span> 
                    in these many fields to create <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">innovative solutions</span> 
                    that can <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">help people in their daily lives</span>!

                    <br>
                    <br>
                
                    <!-- <div class="lg:px-3 px-0 lg:py-1 py-0 hover:bg-dark-grey hover:text-light-grey transition-all ease-in-out duration-300 group"> -->
                        I am also open to 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">freelance work</span>, 
                        <!-- I can handle pretty much anything you throw at me,  -->
                        be it <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">web app development</span>, 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">data science and analysis</span> tasks, 
                        <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">building, training, and fine tuning machine learning models</span>, 
                        or anything in between those.
                        And I'm a <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">fast learner</span>, so even new subjects are welcome, 
                        feel free to 
                        <span @click="contactClicked" class="cursor-pointer underline text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">contact me</span> if you have any project in mind!
                    <!-- </div> -->

                    <br>
                    <br>


                    <!-- <div class="hover:bg-dark-grey hover:text-light-grey transition-all ease-in-out duration-300 group"> -->

                        Oh, and here are some cool facts about me:
                        
                        <ul class="list-disc list-inside ml-[1rem]">
                            <li>I have friends from <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">all over the world</span> (thanks Erasmus!)</li>
                            <li>I love <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">travelling</span> and <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">discovering new cultures</span> (visited 15 countries so far, and still counting!)</li>
                            <li>I would die for <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">chocolate</span></li>
                            <li>I am fluent in <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">arabic</span>, <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">french</span> and <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">english</span></li>
                            <li>I am a huge <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">One Piece</span> fan</li>
                            <li>I really enjoy <span class="text-green-tech group-hover:text-middle-grey transition-all ease-in-out duration-300">working out</span></li>
                        </ul>
                    <!-- </div> -->

						

                </div>

                <div class="lg:w-[25%] w-0 lg:px-[2rem] px-0 flex justify-center items-center">
                    <img src="/images/profile-pic.png" alt="" class="object-contain">
                </div>

            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: 'About',

    emits: ['contactClicked', 'hideClicked'],

	props: ['hide'],

    methods: {
        contactClicked() {
            this.$emit('contactClicked');
        },

		hideShow() {
			this.$emit('hideClicked');
		}
    }
}

</script>

