<template>

    <div class="w-full mb-[3rem] flex flex-col items-center justify-center lg:items-start lg:justify-start">
        <div class="lg:text-5xl text-3xl font-semibold">Certifications</div>
        <div class="mt-[0.75rem] h-[1px] w-3/4 bg-middle-grey"></div>
        
        <div class="w-full mt-[1rem] lg:text-base text-sm text-middle-grey">
            <div class="grid lg:grid-cols-5 grid-cols-3 lg:gap-x-[1rem] lg:gap-y-[0.5rem] gap-x-[0.5rem] gap-y-[1rem] items-center">
				<a v-for="cert in certs" :href="cert.url" target="_blank">
					<img :src="cert.image" alt="" class="lg:h-[10rem] h-[7rem] object-contain">
				</a>
			</div>

        </div>

    </div>

</template>

<script>

export default {
	data() {
		return {
			certs: [
				{
					"name": "AWS Solutions Architect - Associate (SAA-C03)",
					"image": "/images/aws-certified-solutions-architect-associate.png",
					"url": "https://www.credly.com/badges/5620572d-5124-4c5d-973d-80a9d1396b17/public_url"
				},
			]
		}
	}
}

</script>