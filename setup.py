from setuptools import setup

setup(
        name='allumette',
        version='0.1',
        description='A version of the classic Nim game made to be used all from the keyboard',
        author='Fauve',
        author_email='contact@taniere.info',
        install_requires=['pygame'],
        url='https://github.com/FauveNoir/allumette',
        download_url='https://github.com/FauveNoir/allumette/archive/master.zip',
        packages=['allumette'],
        package_dir={'allumette': '.'},
        package_data={'allumette': ['*.png']},
        entry_points={
            'console_scripts': ['allumette = allumette.nim:main'] 
        }
)
