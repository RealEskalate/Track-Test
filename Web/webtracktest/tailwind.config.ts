import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        foreground: 'rgb(var(--foreground-rgb))',
        'background-start': 'rgb(var(--background-start-rgb))',
        'background-end': 'rgb(var(--background-end-rgb))',
      },
      backgroundImage: {
        'gradient-linear': 'linear-gradient(to bottom, transparent, var(--background-end)) var(--background-start)',
      },
    },
  },
  variants: {},
  plugins: [],
}
export default config
