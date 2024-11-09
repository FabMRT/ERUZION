/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      animation: {
        grain: 'grain 4s steps(4) infinite',
      },
      keyframes: {
        grain: {
          '0%, 100%': { transform: 'translate(0, 0) scale(1.5)' },
          '10%': { transform: 'translate(-2%, -2%) scale(1.5)' },
          '20%': { transform: 'translate(-4%, 2%) scale(1.5)' },
          '30%': { transform: 'translate(2%, -4%) scale(1.5)' },
          '40%': { transform: 'translate(2%, 2%) scale(1.5)' },
          '50%': { transform: 'translate(-4%, -2%) scale(1.5)' },
          '60%': { transform: 'translate(4%, 4%) scale(1.5)' },
          '70%': { transform: 'translate(2%, -2%) scale(1.5)' },
          '80%': { transform: 'translate(-2%, 2%) scale(1.5)' },
          '90%': { transform: 'translate(4%, -4%) scale(1.5)' },
        },
      },
    },
  },
  plugins: [],
}