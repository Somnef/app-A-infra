<template>

    <div class="fixed top-0 left-0 w-screen h-screen overflow-clip">

        <div class="fixed top-0 left-0 w-full h-full bg-dark-grey -z-50 pointer-events-none">
            
        </div>

        <div class="fixed top-0 left-0 w-full h-full opacity-[10%] -z-40 pointer-events-none">
            <img src="/images/texture.jpg" alt="" class="w-full h-full object-cover">

        </div>
        
        <!-- <div class="fixed w-[50rem] h-[50rem] rounded-full z-50 pointer-events-none" id="mouse-follower">
            
        </div> -->
    </div>
</template>

<script>
export default {
    name: 'Background',

    // mounted() {
    //     // Get the mouse follower element to follow the mouse
    //     const mouseFollower = document.getElementById('mouse-follower');

    //     // Add an event listener to the window to track the mouse movement
    //     window.addEventListener('mousemove', (e) => {
    //         // Set the position of the mouse follower to the mouse position
    //         mouseFollower.style.left = e.clientX + 'px';
    //         mouseFollower.style.top = e.clientY + 'px';
    //     });

    //     // Center the mouse follower element around the mouse
    //     mouseFollower.style.transform = 'translate(-50%, -50%)';
    // },
    
}
</script>

<!-- <style scoped>

#mouse-follower {
    background: radial-gradient(circle, 
                rgba(255, 255, 255, 0.2) 0%,
                rgba(255, 255, 255, 0) 25%   
                );
}

</style> -->