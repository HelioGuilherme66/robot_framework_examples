# Robot Framework Examples

## Intro

This project consists in Robot Framework test suites. They are just sample cases and do not represent best practices or coding quality.

You should see [https://robotframework.org](https://robotframework.org).

I recommend the use of [RIDE - Robot Framework IDE](https://github.com/robotframework/RIDE).

## Gerkin

The tests are in `gerkin_tests`. They illustrate the use of `Language:` setting in the test cases. The default, English and both Portuguese variants. If you want to contribute with other languages, you can easily adapt to your language. In RIDE you can translate the settings automatically to your desired language:

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
            │   ├── demo_app.html
            │   ├── demo_app_pt_br.html
            │   ├── demo_app_pt_pt.html
            │   ├── user_profile.html
            │   └── user_profile_pt.html
            ├── bank_variables_pt_br.py
            ├── bank_variables_pt_pt.py
            ├── bank_variables.py
            ├── English.robot
            ├── Português_Brasil.robot
            └── Português_Portugal.robot
```

### See my YouTube channel
Videos about RIDE and Robot Framework, [@About_RIDE](https://www.youtube.com/@About_RIDE)

