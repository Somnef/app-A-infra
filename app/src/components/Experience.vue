<template>
    <div class="w-full mb-[3rem] flex flex-col items-center justify-center lg:items-start lg:justify-start">
        <div class="lg:text-5xl text-3xl font-semibold text-center">Professional Experience</div>
        <div class="mt-[0.75rem] h-[1px] w-3/4 bg-middle-grey"></div>
        <div class="mt-[1rem] lg:text-base text-sm text-middle-grey flex flex-col lg:gap-y-0 gap-y-[3rem] items-center">
            
            <ExperienceCard v-for="experience in experiences" :date="experience.date" :title="experience.title" :company="experience.company" :description="experience.description" :techs="experience.techs" :link="experience.link" />

        </div>

        <div class="lg:text-xl text-base text-light-grey mt-[1rem]">
            You can also check out my <a href="https://raw.githubusercontent.com/Somnef/resume-latex/main/english-cloud/english-cloud.pdf" target="_blank" class="underline text-green-tech hover:text-light-grey transition-all ease-in-out duration-300">resume</a>.
        </div>

    </div>
</template>

<script>

import ExperienceCard from './ExperienceCard.vue'

export default {
    components: {
        ExperienceCard
    },

    data() {
        return {
            experiences: [
				{
                    date: 'Jan 2025 - Jun 2025',
                    title: 'Cloud Developer',
                    company: 'University of Lorraine',
                    description: [
						"Developed a blockchain identity system based on Self-Sovereign Identities with Hyperledger Indy",
						"Deployed Docker containers for the agents acting on the blockchain (Aca-Py agents) on AWS with ECS Fargate",
						"Designed and built the frontend and backend layers (VueJS, FastAPI, MongoDB) and deployed them on EC2 machines on public and private AWS subnets respectively to interact with the Aca-PY agents"
					],
                    techs: ['AWS', 'Docker', 'Kubernetes', 'Hyperledger Indy', 'FastAPI', 'Vue.js'],
                    link: 'https://www.univ-lorraine.fr',
                },
                {
                    date: 'Jan 2023 - Jul 2023',
                    title: 'Cloud Developer',
                    company: 'SLB (ex-Schlumberger)',
                    description: [
						"Setup of a solution for tracking imported assets, of which the loss was costing the company up to 75% of the asset’s original value in penalties",
						"Built a REST API managing 1000+ transactions/day on a private blockchain of Hyperledger Fabric",
						"Developed a Flask/VueJS application to manage the user interface and the requests towards the blockchain",
						"Deployed the API on API Gateway, the blockchain on ECS Fargate, and the front and back applications on EC2",
					],
                    techs: ['AWS', 'Docker', 'Hyperledger Fabric', 'Node.js', 'Express.js', 'Vue.js', 'Solidity'],
                    link: 'https://www.slb.com',
                },
                {
                    date: 'Oct 2022 - Jan 2023',
                    title: 'Cloud & AI Engineer',
                    company: 'Ericsson',
                    description: [
						"Internship where I work on understanding how networking occurs in IoT systems, and how we can use deep learning techniques within them to boost efficiency and security.",
					],
                    techs: ['Python', 'PyTorch', 'Pandas', 'Google Collab', 'AWS'],
                    link: 'https://www.ericsson.com/en',
                },
                {
                    date: 'May 2022 - Jul 2022',
                    title: 'Consultant / Data Analyst',
                    company: 'BH Advisory',
                    description: [
						"The mission consisted of monitoring the construction materials market in Algeria, study the price trends and quantities imported/exported over the last decade.",
					],
                    techs: ['Python', 'Pandas', 'Matplotlib', 'Excel'],
                    link: 'https://bravehill-dz.com',
                },
                {
                    date: 'Dec 2021 - Dec 2022',
                    title: 'Freelancer',
                    company: 'Innoprofits',
                    description: [
						"Analysis of startup projects and highlight of the technical complexity in which the startup is trying to innovate.",
					],
                    techs: [],
                    link: 'https://www.innoprofits.com'
                },
                {
                    date: 'Nov 2021 - May 2022',
                    title: 'Data Scientist',
                    company: 'AiTech',
                    description: [
						"Research on processing, cleaning, classifying and detecting outliers in data drawn from the company's ERP."
					],
                    techs: ['Python', 'Pandas', 'Matplotlib'],
                    link: 'https://www.aitech.app'
                },
                {
                    date: 'Feb 2021 - Mar 2021',
                    title: 'Discovery Intern',
                    company: 'CasbahTech',
                    description: [
						"Initiation to work in a company, introduction to web development and teamwork with AGILE methodology.",
					],
                    techs: ['JavaScript', 'Python'],
                    link: ''
                },
            ],
        }
    },
}

</script>

