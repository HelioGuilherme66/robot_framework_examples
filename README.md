# Robot Framework Examples

## Intro

This project consists in Robot Framework test suites. They are just sample cases and do not represent best practices or coding quality.

You should see [https://robotframework.org](https://robotframework.org).

I recommend the use of [RIDE - Robot Framework IDE](https://github.com/robotframework/RIDE).

## Gerkin

The tests are in `gerkin_tests`. They illustrate the use of `Language:` setting in the test cases. The default, English, French and both Portuguese variants. If you want to contribute with other languages, you can easily adapt to your language. In RIDE you can translate the settings automatically to your desired language:

1. Make a copy of the .robot file
2. Open that new file in RIDE
3. On the Text Editor edit the name of the language after the `Language:` marker
4. Click `Apply Changes` 

The settings should now be in the language you defined.

## File structure
```
LICENSE
README.md
gerkin_tests/
            ├── app
            |   ├── demo_app_fr.html
            |   ├── demo_app.html
            |   ├── demo_app_pt_br.html
            |   ├── demo_app_pt_pt.html
            |   ├── user_profile_fr.html
            |   ├── user_profile.html
            |   └── user_profile_pt.html
            ├── bank_variables_fr.py
            ├── bank_variables_pt_br.py
            ├── bank_variables_pt_pt.py
            ├── bank_variables.py
            ├── English.robot
            ├── Français.robot
            ├── Português_Brasil.robot
            └── Português_Portugal.robot
```

### See my YouTube channel
Videos about RIDE and Robot Framework, [@About_RIDE](https://www.youtube.com/@About_RIDE)

## Tests for the practice site, Expand Testing

The [Expand Testing practice site](https://practice.expandtesting.com/) contains web pages and apps to practice test automation.
We have some examples to apply on that practice site, that you can copy and experiment on your own.

The directory `ExpandTesting` contains the tests organized by directories like the "cards" on the pages. The directory `extract_examples` is an exception. This task shows one way to obtain all the "cards" links and the description, and save to a file.

## File structure
```
ExpandTesting/
             ├── extract_examples
             │   └── scrap_examples.robot
             ├── Login
             │   ├── login_resource.resource
             │   ├── Login_tests.robot
             │   └── login_variables.py
             └── main_variables.py
```
