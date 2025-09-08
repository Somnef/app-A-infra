/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./index.html",
        "./src/**/*.{js,ts,jsx,tsx,vue}",
      ],
  theme: {
    extend: {
        colors: {
            'dark-grey': '#1f1f1f',
            'almost-black': '#070D0D',
            'green-tech': '#00bfa6',
            'light-grey': '#f4f4f4',
            'middle-grey': '#9c9c9c',
        }
    },
  },
  plugins: [],
}

