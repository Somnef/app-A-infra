<template>

    <div class="fixed w-[50rem] h-[50rem] rounded-full z-50 pointer-events-none" id="mouse-follower">

    </div>

</template>

<script>
export default {
    name: 'Background',

    mounted() {
        // Get the mouse follower element to follow the mouse
        const mouseFollower = document.getElementById('mouse-follower');

        // Add an event listener to the window to track the mouse movement
        window.addEventListener('mousemove', (e) => {
            // Set the position of the mouse follower to the mouse position
            mouseFollower.style.left = e.clientX + 'px';
            mouseFollower.style.top = e.clientY + 'px';
        });

        // Center the mouse follower element around the mouse
        mouseFollower.style.transform = 'translate(-50%, -50%)';
    },

}
</script>

<style scoped>
#mouse-follower {
    background: radial-gradient(circle,
            rgba(255, 255, 255, 0.2) 0%,
            rgba(255, 255, 255, 0) 20%);
}
</style>